FROM gcr.io/cloud-builders/gcloud
RUN apt-get update
#RUN apt-get install --yes postgresql-client jq
#RUN apt-get install --yes pwgen
#RUN apt-get install --yes vim-common

ENV PATH="/:${PATH}"
ENV TF_IN_AUTOMATION="TRUE"
COPY --from=eu.gcr.io/ply-test-deploy/testgt:master ./testgt /testgt
#COPY --from=eu.gcr.io/ply-test-deploy/testgt:master /testgt/project-setup.sh /testgt/project-setup.sh
#COPY --from=eu.gcr.io/ply-test-deploy/testgt:master /testgt/*.tf /testgt/*.tf
COPY ./dev.tfvars /testgt/
RUN ls -lrt
RUN ls testgt

ENTRYPOINT ["./testgt/project-setup.sh"]