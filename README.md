# Kaptin Reactions

Custom TensorReactions profiles distributed through AnyoneCore.

## Install and update

1. Open **AnyoneCore > SYSTEM > Third Party > Sources**.
2. Add `https://github.com/KaptinOdium/Reactions`.
3. Open **Updater**, update this source, then reload as prompted.
4. Select the desired general or timeline profile in TensorReactions.

The repository uses AnyoneCore's standard `GeneralReactions` and `TimelineReactions` folders. Updates published to the repository are available through AnyoneCore's third-party updater. Local edits are not automatically uploaded to GitHub; publish your changes to `main` before updating clients.

## Included profiles

25 profiles: 5 general and 20 timeline profiles. Existing filenames, paths, and Lua contents are preserved, including spaces and the two timeline profiles at the folder root.

## Requirements

- TensorReactions, TensorCore, and AnyoneCore.
- Argus/Argus2 for drawing features.
- Moogle Telegraphs for profiles that use its settings or drawing helpers, including FTB, FTM EX, and Occult Crescent.
- The corresponding installed job ACRs for job-specific actions and toggles.
- Anyone reaction packs referenced by profile inheritance, including DMU, DSR, M9S–M12S, Zelenia, Sphene, and criterion content as applicable.
- `Lj/umad/draws_lpdu` for DMU profiles that inherit it.
- ArgusDrawsPlus is used by optional guarded overlays in FTM EX and Occult Crescent.

Referenced third-party packs and personal saved settings are not included.

## Existing profile note

`TimelineReactions/Kaptin/Kaptin - Zelenia SAM .lua` currently inherits the unqualified profile name `Zelenia Kaptin draws`, while the included draw profile is under `Kaptin/Zelenia Kaptin draws`. That reference was preserved from the original profile and may require adjustment in TensorReactions on the client.

## Sources

- [AnyoneCore example repository](https://github.com/anyoneminion/reactions-example)
- [Third-party installation example](https://github.com/Jacob5800/Reactionsoccult/blob/main/README.md)

