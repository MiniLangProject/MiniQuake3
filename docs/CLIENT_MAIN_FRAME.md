# Client main frame

`mq3.client.frame` ports the outer `CL_Frame` together with
`CL_CheckTimeout` and `CL_CheckUserinfo`. It handles CD/menu transitions,
AVI fixed-rate capture, realtime, time graph, userinfo forwarding, the
six-frame timeout grace and the original per-frame order:

`SendCmd → CheckForResend → SetCGameTime → Screen → Sound → Cinematic → Console`

The service object carries the concrete network, protocol and demo runtimes so
the remaining renderer, sound and UI implementations can replace their
callbacks without changing frame policy. Thirteen unchanged-C records and 28
MiniLang contracts pass. Run `python scripts/test_client_main_frame.py`.
