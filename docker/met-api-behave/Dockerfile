FROM metapi
MAINTAINER Martin Grønlien Pejcoch <mpejcoch@gmail.com>

# Packages needed for "behave" tests
RUN DEBIAN_FRONTEND=noninteractive apt-get -qq -y install python-pip

# Install and run "behave" tests
RUN pip install behave PyHamcrest

WORKDIR /root/met-api

# Cleanup
RUN git reset --hard
RUN git clean -fdx
RUN git pull

RUN sed -i 's/localhost/metapi/g' tests/acceptance/behave/features/product_info.feature
CMD behave tests/acceptance/behave