FROM registry.rcluster.io/base/base-s:golden
EXPOSE 8080 8081 8082 8083
COPY bin/harnitsignalfxpoc /app/harnitsignalfxpoc
COPY start.sh /app/start.sh
RUN chmod +x /app/harnitsignalfxpoc
RUN chmod +x /app/start.sh
ENTRYPOINT ["sh", "/app/start.sh"]
CMD ["/app/harnitsignalfxpoc", "all"]
