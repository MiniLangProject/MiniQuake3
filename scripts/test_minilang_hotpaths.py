"""Guard the MiniLang hot paths against accidental quadratic array copying."""

from pathlib import Path

from toolchain import ROOT


CHECKS = {
    "src/mq3/renderer/playable_materials.ml": {
        "requires": ("std.string_builder", "StringBuilder.withCapacity"),
        "forbids": ("text=text+decode(source)",),
    },
    "src/mq3/renderer/shader_index.ml": {
        "requires": ("std.ds.list", "entryList.add(entry)"),
        "forbids": ("entries=entries+[entry]",),
    },
    "src/mq3/format/md3.ml": {
        "requires": ("frames=array(numFrames,void)", "surfaces=array(numSurfaces,void)"),
        "forbids": (
            "frames=frames+[",
            "surfaces=surfaces+[",
            "triangles=triangles+[",
            "texCoords=texCoords+[",
            "packedFrames=packedFrames+[",
        ),
    },
    "src/mq3/engine/local_qvm_match.ml": {
        "requires": ("mapped=array(context.entityCount,void)", "entities=array(frame.numEntities,void)"),
        "forbids": ("mapped=mapped+[", "entities=entities+["),
    },
    "src/mq3/client/qvm_preview_app.ml": {
        "requires": ("for each event in nativeEvents", "applyInputEvent(inputBridge,state,event)"),
        "forbids": ("pendingInputEvents=pendingInputEvents+[", "slice(pendingInputEvents,1,"),
    },
    "src/mq3/platform/playable_window.ml": {
        "requires": ("std.ds.list", "result.add(event)"),
        "forbids": ("events=events+[",),
    },
    "src/mq3/audio/qvm_playback.ml": {
        "requires": ("left=array(state.chunkFrames,0)", "active=lists.List.withCapacity"),
        "forbids": ("left=left+[", "right=right+[", "active=active+[", "kept=kept+["),
    },
    "src/mq3/renderer/world_surface_selection.ml": {
        "requires": ("sorting.sortBy(candidates,before)", "candidateList.add(candidate)"),
        "forbids": ("insertCandidate(candidates", "faces=faces+[", "selected=selected+["),
    },
    "src/mq3/renderer/qvm_2d_batch.ml": {
        "requires": ("quadList.add", "runList.add", "current.add(quad)"),
        "forbids": ("quads=quads+[", "catalog.runs=catalog.runs+[", "current=current+["),
    },
    "src/mq3/renderer/qvm_scene_geometry.ml": {
        "requires": ("edges[vertexIndex]=lists.List.withCapacity", "positions=array(3,void)"),
        "forbids": ("shadowPositions=shadowPositions+[", "worldSide=worldSide+[", "positions=positions+["),
    },
    "src/mq3/renderer/qvm_scene_batch.ml": {
        "requires": ("result=maps.HashMap.new()", "origins=array(count,void)"),
        "forbids": ("result=result+[ShadowPolicy", "policyIndex=0 to result.len()-1", "origins=origins+["),
    },
    "src/mq3/collision/world.ml": {
        "requires": ("stack = worldTraceLists.List.new()", "num = stack.pop()",
                     "entries=worldTraceLists.List.withCapacity", "points=array(count,void)",
                     "contents=contents|brushPointContents"),
        "forbids": ("stack = arrays.slice(stack", "stack = stack + [[",
                    "leaves = leaves+[", "result.entries = result.entries+[",
                    "points=points+[", "brushes=brushes+[", "surfaces=surfaces+[",
                    "selected = selected+[")
    },
}


def main() -> None:
    failures: list[str] = []
    for relative, rules in CHECKS.items():
        text = (ROOT / relative).read_text(encoding="utf-8")
        for required in rules["requires"]:
            if required not in text:
                failures.append(f"{relative}: missing required hot-path structure {required!r}")
        for forbidden in rules["forbids"]:
            if forbidden in text:
                failures.append(f"{relative}: quadratic hot-path pattern returned: {forbidden!r}")
    if failures:
        raise SystemExit("FAIL:\n" + "\n".join(failures))
    print(f"PASS: {len(CHECKS)} MiniLang hot-path structure contracts")


if __name__ == "__main__":
    main()
