**Archived:** This repository is in _read-only_ mode.   
The Elyra installation is included in ODH workbench images directly.  
Please refer to the ODH base notebook images, to utilize elyra.  
Further contact: https://github.com/opendatahub-io/notebooks  

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
- [Python and R script editors with local/remote execution capabilities](https://elyra.readthedocs.io/en/latest/getting_started/overview.html#python-and-r-scripts-execution-support)
- [Python script navigation using auto-generated Table of Contents](https://elyra.readthedocs.io/en/latest/getting_started/overview.html#python-script-execution-support)
- [Notebook navigation using auto-generated outlines using Table of Contents](https://elyra.readthedocs.io/en/latest/getting_started/overview.html#notebook-navigation-using-auto-generated-table-of-contents)
- [Version control using Git integration](https://elyra.readthedocs.io/en/latest/getting_started/overview.html#version-control-using-git-integration)
- [Language Server Protocol integration](https://elyra.readthedocs.io/en/latest/getting_started/overview.html#language-server-protocol-integration)


The [Elyra Getting Started Guide](https://elyra.readthedocs.io/en/latest/getting_started/overview.html)
includes more details on these features.

- Image is preconfigured to work with the CRI-O container engine
- If you want to use Elyra with a pipeline runtime such as Kubeflow Pipelines or Apache Airflow, you will need to first
[add a new pipeline runtime configuration](https://elyra.readthedocs.io/en/latest/user_guide/runtime-conf.html#runtime-configuration).
    - `Tekton` is the default compilation engine used by Open Data Hub when installing Kubeflow. Be sure to select the `Tekton` engine in the `Kubeflow Pipelines engine` dropdown menu when adding a new configuration for Kubeflow Pipelines.
    - If Kubeflow Pipelines is installed using default configurations and in the same namespace as ODH, you may be able to use the following internal network routes for your Kubeflow pipelines configurations: 
      ```bash
        Kubeflow Pipelines API Endpoint: http://ml-pipeline-ui.kubeflow/pipeline
        Cloud Object Storage Endpoint: http://minio-service.kubeflow:9000
      ```
    - If adding an Apache Airflow runtime, please note these [required parameters](https://elyra.readthedocs.io/en/latest/user_guide/runtime-conf.html#apache-airflow-configuration-settings) in the configuration
