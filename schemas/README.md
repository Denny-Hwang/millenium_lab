# schemas/ — Single Source of Truth for Metadata

The YAML files in this directory are the **single source of truth** for
every piece of metadata used in the repository. No metadata file may
bypass these schemas; `scripts/validate-meta.py` checks all metadata at
PR time.

## Schema Index

| File | Applies to | ID pattern |
|------|------------|------------|
| [`attempt-meta.schema.yaml`](attempt-meta.schema.yaml) | `attempts/<problem>/A###/meta.yaml` | `^A\d{3}$` |
| [`candidate-meta.schema.yaml`](candidate-meta.schema.yaml) | `candidates/PC-###/meta.yaml` | `^PC-\d{3}$` |
| [`conjecture-meta.schema.yaml`](conjecture-meta.schema.yaml) | `conjectures/C-###/meta.yaml` | `^C-\d{3}$` |
| [`bridge-meta.schema.yaml`](bridge-meta.schema.yaml) | `bridges/B-###.md` (front matter) | `^B-\d{3}$` |

## Schema Format

JSON Schema (Draft 2020-12) serialized as YAML. The `$schema` field is
intentionally omitted; the validation script handles it.

## Change Procedure

Schema changes follow this procedure:

1. The change PR includes a migration plan (how existing metadata will
   be updated).
2. CI confirms that existing metadata still passes the new schema.
3. Any metadata that does not pass is updated in the same PR or a
   follow-up PR.
4. After merge, the new schema is the single source of truth
   immediately.
