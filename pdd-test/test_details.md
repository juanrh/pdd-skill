Validations:

- parameter types 
- division by zero.

Design: separate classes for

- calculator model
- API operations: use a versioned API

testing 

- unit test: for calculator model 
- integration tests: hit validations

## Setup 

Demo: screen recording with vibe CLI on Zed, ideally with Gemma4 on Ollama
Note: skill do work in the Mistral agent for Zed, when properly setup
Note: seems to perform better with a separate agent session per phase (which makes sense)

Check for requirements:

- api verisioning
- unit test and integ test
- Generate openapi spec
- Create a Makefile with targets for ruff linting, typecking, checks (calls lint and typecheck), and run the server
