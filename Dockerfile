FROM alpine:3.16

# Update package repo indexes
RUN apk -q update

# Update packages
RUN apk -q upgrade

COPY entrypoint.sh /entrypoint.sh
RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT ["/entrypoint.sh"]
