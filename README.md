# PDD skill

This is a skill to emulate [Spec-Driven Development](https://www.youtube.com/watch?v=4qcWgPb-8Fk) as implemented on [Kiro](https://kiro.dev/docs/specs/), using the [Prompt-Driven Development](https://youtu.be/cf-WOKVn768?si=dNfaTMhOcJVYxsCk&t=2480) approach that was its predecessor. 

## Installation

Copy the directory `pdd` to your coding agent skills directory (e.g. `.vibe/skills`).

## Development

Install and use [`skills-ref` skills validator](https://agentskills.io/specification#validation):

```bash
## Install
uv tool install skills-ref
# Validate: this checks tokens and line limits recommended in the specification.
## Note this will fail for vendor specific frontmatter keys like Vibe's CLI `user-invocable:` 
agentskills validate pdd
```

## Attribution

- agent-sop-format.md, code-assist.sop.md, codebase-summary.sop.md,  code-task-generator.sop.md, pdd.sop.md: copied from https://github.com/strands-agents/agent-sop/tree/main/agent-sops under Apache License 2.0. Pieces of that content are used in several places of this project.
- FastAPI skill (pdd-test/.vibe/skills/fastapi) taken from https://github.com/fastapi/fastapi/tree/master/fastapi/.agents/skills/fastapi under MIT license.
- modern-python skill (pdd-test/.vibe/skills/modern-python) taken from https://officialskills.sh/trailofbits/skills/modern-python
