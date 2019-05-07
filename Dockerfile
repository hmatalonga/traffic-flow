FROM python:3.7-slim

RUN apt-get update && apt-get install -y curl g++ make

RUN curl -L http://download.osgeo.org/libspatialindex/spatialindex-src-1.8.5.tar.gz | tar xz

RUN cd spatialindex-src-1.8.5 && \
    ./configure && \
    make && \
    make install && \
    ldconfig

COPY ./requirements.txt /tmp/requirements.txt

RUN mkdir /opt/notebooks

RUN pip install --no-cache-dir -r /tmp/requirements.txt

EXPOSE 8888

CMD [ "bash", "-c", "jupyter notebook --ip='0.0.0.0' --port=8888 --notebook-dir=/opt/notebooks --no-browser --allow-root --NotebookApp.token='' --NotebookApp.password=''" ]
