shell:
	docker exec -i -t hadoop /bin/bash

hive:
	docker exec -i -t hadoop /opt/hive/bin/hive

hbase:
	docker exec -i -t hadoop /opt/hbase/bin/hbase shell

pig:
	docker exec -i -t hadoop /opt/pig/bin/pig -x local
