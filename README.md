# elrepo-mirror-docker

<p align="center">
    <a href="https://travis-ci.com/github/flavienbwk/elrepo-mirror-docker" target="_blank">
        <img src="https://travis-ci.com/flavienbwk/elrepo-mirror-docker.svg?branch=main&status=passed"/>
    </a>
</p>
<p align="center">Status : tested & working :heavy_check_mark:</p>

## Downloading & updating

1. Setup your ElRepo version and releases in `mirror.sh`

2. Run the `mirror` container :

    ```bash
    docker-compose build
    docker-compose up mirror
    ```

> Tips: We recommend you downloading the mirror from [a cloud provider](https://www.scaleway.com/en/) and then transfer the files to your computer.

## Serving

1. Check your mirroring succeeded in `./mirror/*` or typing `du -sh ./mirror` to check the volume

    The default configuration should make you download _XX G_

2. Run the server :

    ```bash
    docker-compose up -d server
    ```

    Server will run on [`localhost:8080`](http://localhost:8080)  

## Client configuration

On you server, retrieve and add the GPG key :

```bash
wget http://192.168.0.24:10082/RPM-GPG-KEY-elrepo.org
rpm --import RPM-GPG-KEY-elrepo.org
```

To point your ElRepo clients to your mirror, create a `/etc/yum.repos.d/local-elrepo-mirror.repo` file as follow :

```conf
[mymirror-elrepo-base]
name=My CentOS 7 EPEL local mirror for os packages
baseurl=http://192.168.0.24:10082/kernel/el7/kernel/el7/$basearch/
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-elrepo.org
enabled=1

[mymirror-elrepo-base]
name=My CentOS 7 EPEL local mirror for os packages
baseurl=http://192.168.0.24:10082/kernel/el7/kernel/el7/$basearch/
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-elrepo.org
enabled=1
```

:point_right: Feel free to add a reverse proxy or update the [nginx configuration file](./nginx.conf) to secure the mirror with SSL/TLS  
:point_right: Feel free to send **pull requests** as well !
