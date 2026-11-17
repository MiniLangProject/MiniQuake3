"""Check original RCON redirect evidence without requiring Windows or game data."""
from pathlib import Path
import sys
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / 'scripts'))
from test_original_server_interop import decode_rcon_packet, validate_server_evidence


class OriginalServerEvidenceTests(unittest.TestCase):
    endpoint = ('127.0.0.1', 27960)
    prefix = b'\xff' * 4 + b'print\n'
    token = 'current-run-token'

    def setUp(self):
        # Com_Printf writes the first begin to qconsole. During RCON it sends
        # the second begin through SV_FlushRedirect instead of logging it.
        self.console = (
            'ClientBegin: 0\n'
            f'say: MQ3Interop: MQ3_PROTOCOL68_ROUNDTRIP_{self.token}\n'
            'Rcon from 127.0.0.1:40000:\nmap_restart\n'
            f'say: MQ3Interop: MQ3_PROTOCOL68_RESTART_{self.token}\n'
        )
        self.redirect = '------- Game Initialization -------\nClientBegin: 0\n'

    def test_original_output_paths_prove_same_client_restart(self):
        proof = validate_server_evidence(self.console, self.redirect, self.token)
        self.assertEqual(proof['restarted_client_numbers'], [0])
        self.assertTrue(proof['map_restart_logged'])
        self.assertTrue(proof['both_chats_logged'])

    def test_redirect_chunks_preserve_split_lines_and_latin1_bytes(self):
        payloads = [b'caf\xe9\nClientBe', b'gin: 0\n']
        decoded = ''.join(decode_rcon_packet(self.prefix + p, self.endpoint,
                                             self.endpoint) for p in payloads)
        self.assertEqual(decoded, 'caf\xe9\nClientBegin: 0\n')
        self.assertEqual(validate_server_evidence(self.console, decoded, self.token)
                         ['restarted_client_numbers'], [0])

    def test_wrong_source_is_not_server_evidence(self):
        for source in [('127.0.0.2', 27960), ('127.0.0.1', 27961)]:
            with self.subTest(source=source):
                self.assertIsNone(decode_rcon_packet(self.prefix + b'ClientBegin: 0\n',
                                                     source, self.endpoint))

    def test_only_original_oob_print_framing_is_accepted(self):
        for packet in [b'ClientBegin: 0\n', b'\xff'*3+b'print\nClientBegin: 0\n',
                       b'\xff'*4+b'infoResponse\nClientBegin: 0\n',
                       b'\xff'*4+b'print ClientBegin: 0\n']:
            with self.subTest(packet=packet):
                self.assertIsNone(decode_rcon_packet(packet, self.endpoint, self.endpoint))

    def test_repeated_initial_begin_cannot_replace_redirect_evidence(self):
        with self.assertRaisesRegex(RuntimeError, 'same-client restart'):
            validate_server_evidence(self.console + 'ClientBegin: 0\n', '', self.token)

    def test_redirect_begins_cannot_replace_initial_console_evidence(self):
        with self.assertRaisesRegex(RuntimeError, 'initial ClientBegin'):
            validate_server_evidence(self.console.replace('ClientBegin: 0\n', ''),
                                     self.redirect + 'ClientBegin: 0\n', self.token)

    def test_different_restarted_client_does_not_pass(self):
        with self.assertRaisesRegex(RuntimeError, 'same-client restart'):
            validate_server_evidence(self.console, 'ClientBegin: 1\n', self.token)

    def test_both_current_run_chat_markers_are_required(self):
        for prefix in ['MQ3_PROTOCOL68_ROUNDTRIP_', 'MQ3_PROTOCOL68_RESTART_']:
            with self.subTest(prefix=prefix):
                stale = self.console.replace(prefix + self.token, prefix + 'previous-run')
                with self.assertRaisesRegex(RuntimeError, 'chat in qconsole'):
                    validate_server_evidence(stale, self.redirect, self.token)

    def test_restart_requires_exact_console_command_line(self):
        misleading = self.console.replace('\nmap_restart\n', '\nchat: map_restart\n')
        with self.assertRaisesRegex(RuntimeError, 'map_restart in qconsole'):
            validate_server_evidence(misleading, self.redirect + 'map_restart\n', self.token)


if __name__ == '__main__':
    unittest.main()
