# Botlib AI trap audit (500-577)

This audit compares the MiniQuake3 dispatcher with the bundled Quake III
sources at `code/game/g_public.h`, `code/server/sv_game.c`, and
`code/botlib/be_ai_*.c`. Every opcode in the inclusive 500-577 range is routed;
the remaining gaps are fidelity limits inside routed implementations rather
than missing dispatcher cases.

| Opcodes | Original subsystem | MiniQuake3 status | Known fidelity limit |
| --- | --- | --- | --- |
| 500-506 | character profiles | Implemented | Invalid handles return safely instead of emitting the original fatal diagnostic. |
| 507-508 | chat-state pool | Implemented | Invalid-handle diagnostics are softened. |
| 509-512 | console-message heap | Implemented | The live host propagates `max_messages`; the released default is 1024. |
| 513-524 | initial/reply chat, matching, synonyms, profiles | Implemented | Invalid-handle diagnostics are softened. |
| 525-540 | goal stack, selection, visibility, avoid times | Implemented | Reachability quality follows the host AAS callbacks. |
| 541-542 | static/dynamic level items | Implemented | Static suspended items use the full trigger-push ballistic/BBox path; dynamic dropped items retain the released 30-unit association tolerance. |
| 543-547 | item weights and goal-state lifecycle | Implemented | Weight reload/cache ownership follows the live `bot_reloadcharacters` libvar. |
| 548-557 | movement state and movement | Implemented | All 15 travel handlers used by the released Baseq3 switch are routed through live host collision, mover, liquid and grapple services. |
| 558-566 | weapon choice/config and genetic fuzzy logic | Implemented | Weight reload/cache ownership is now shared with item weights and exact in the runtime API. Opcode 563 is intentionally a no-op in released Baseq3. |
| 567-568 | camp spots and map locations | Implemented | Area numbers inherit host AAS point-area behavior. |
| 569-574 | late chat, visible-position prediction, avoid spots | Implemented | Visible-position accuracy inherits host routing and trace behavior. |
| 575-577 | alternative/predict route and point reachability | Routed | AAS routing fidelity is tracked in the AAS subsystem and excluded here. |

## Weight-config correction

Released `ReadWeightConfig` consults `bot_reloadcharacters`. With reload off,
it reuses one of 128 entries in `weightFileList`; with reload on, every call
parses and returns a distinct mutable config without consuming a cache slot.
`FreeWeightConfig` correspondingly owns only reload-mode instances.

`ai_item_weights.Runtime` now exposes this policy through
`setReloadCharacters`. Item profiles (opcodes 543/544), weapon profiles
(560/562), and mutations/interbreeding (564-566) all share that runtime, so
reload-mode mutations cannot leak between bot states. The local QVM host sets
the switch from the live libvar during botlib setup.

The direct C oracle covers interpolation, cache reuse, reload isolation, the
128-entry limit, and reload bypass. MiniLang contracts cover the same lifecycle
through both item-state and weapon-state bindings, including mutation
isolation.
