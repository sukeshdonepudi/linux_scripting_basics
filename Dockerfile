FROM ubuntu

RUN mkdir -p /home/mveera

COPY ./scripts/sample-bash.sh /home/mveera

CMD ["bash","/home/mveera/sample-bash.sh"]
