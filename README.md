# s2i-lab-elyra

This image contains Elyra and all the dependencies and configurations needed to run as a 
part of OpenDataHub's JupyterHub Environment.

See our latest [changes and features](https://elyra.readthedocs.io/en/latest/getting_started/changelog.html)

### Image Contents

Elyra is a set of AI-centric extensions to JupyterLab Notebooks.

Elyra currently includes the following functionality:

- [Create and run AI pipelines](https://elyra.readthedocs.io/en/latest/getting_started/overview.html#ai-pipelines-visual-editor)
- [Run notebooks as batch jobs](https://elyra.readthedocs.io/en/latest/getting_started/overview.html#ability-to-run-a-notebook-as-a-batch-job)
- [Reusable Code Snippets](https://elyra.readthedocs.io/en/latest/getting_started/overview.html#reusable-code-snippets)
- [Hybrid runtime support](https://elyra.readthedocs.io/en/latest/getting_started/overview.html#hybrid-runtime-support) based on [Jupyter Enterprise Gateway](https://github.com/jupyter/enterprise_gateway)
- [Python script editor with local/remote execution capabilities](https://elyra.readthedocs.io/en/latest/getting_started/overview.html#python-script-execution-support)
- [Python script navigation using auto-generated Table of Contents](https://elyra.readthedocs.io/en/latest/getting_started/overview.html#python-script-execution-support)
- [Notebook navigation using auto-generated outlines using Table of Contents](https://elyra.readthedocs.io/en/latest/getting_started/overview.html#notebook-navigation-using-auto-generated-table-of-contents)
- [Version control using Git integration](https://elyra.readthedocs.io/en/latest/getting_started/overview.html#version-control-using-git-integration)
- [Language Server Protocol integration](https://elyra.readthedocs.io/en/latest/getting_started/overview.html#language-server-protocol-integration)


The [Elyra Getting Started Guide](https://elyra.readthedocs.io/en/latest/getting_started/overview.html)
includes more details on these features.

- Image is preconfigured to work with the CRI-O container engine
- A default runtime metadata instance is installed to work with the default Kubeflow Pipelines instance.
- Added kfp-tekton compiler as the default compiler for Kubeflow Pipelines
