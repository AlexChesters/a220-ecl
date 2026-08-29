# a220-ecl
Electronic Checklist (ECL) for the Synaptic A220 for MSFS

## Copying the checklist file

[`scripts/copy-checklists.ps1`](./scripts/copy-checklists.ps1) copies [`src/checklists.json`](./src/checklists.json)
into every existing directory matching:

```text
C:\Users\alexc\Desktop\msfs2024 addons\Liveries\Synaptic A220\*\Config\*\
```

The wildcard values are discovered when the script runs. Existing `checklists.json` files are overwritten, and the
script reports an error if no matching directories are found.

Run it from PowerShell with:

```powershell
.\scripts\copy-checklists.ps1
```
