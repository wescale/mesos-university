Episode 0

Fill scripts/exportSystem.sh
$ ./exportSystem.sh
$ export ANSIBLE_VARS=episode-0
$ ansible-playbook -i inventory/ec2.py playbooks/seed-ec2-mesos.yml
$ ansible-playbook -i inventory/ec2.py playbooks/seed-ebs-mesos.yml
$ ansible-playbook -i inventory/ec2.py playbooks/mesos.yml

Récupérer l'ip publique du master

Dans un browser, la console mesos se trouve sur http://<ip-master>:5050

Sur une machine tierce <ip-chronos> :
$ curl -sSfL http://downloads.mesosphere.io/chronos/chronos-2.1.0_mesos-0.14.0-rc4.tgz --output chronos.tgz
$ tar xzf chronos.tgz && cd chronos
$ ./bin/start-chronos.bash --master zk://<ip-master>:2181/mesos --zk_hosts zk://<ip-master>:2181/mesos --http_port 8081

Dans un browser, la console chronos se trouve sur http://<ip-chronos>:8081

Episode 1

$ export ANSIBLE_VARS=episode-1
$ ansible-playbook -i inventory/ec2.py playbooks/seed-ec2-mesos.yml
$ ansible-playbook -i inventory/ec2.py playbooks/seed-ebs-mesos.yml
$ ansible-playbook -i inventory/ec2.py playbooks/mesos.yml

Dans un browser, la console marathon se trouve sur http://<ip-master>:5050

TODO Coller ici les requêtes REST

$ ansible-playbook -i inventory/ec2.py playbooks/seed-ec2-bamboo.yml


Episode 2

TODO

curl --data "[{\"name\":\"clicks\",\"columns\":[\"clicks\", \"time\"],\"points\":[[ `tr -cd 0-9 </dev/urandom | head -c 4`, `date +%s%N | cut -b1-13`]]}]" "http://influxdb.univ.aws.xebiatechevent.info/db/db-mesos-university/series?u=root&p=root"
