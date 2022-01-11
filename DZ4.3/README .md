# Домашнее задание к занятию "4.3. Языки разметки JSON и YAML"


## Обязательная задача 1
Мы выгрузили JSON, который получили через API запрос к нашему сервису:
```
    { "info" : "Sample JSON output from our service\t",
        "elements" :[
            { "name" : "first",
            "type" : "server",
            "ip" : 7175 
            }
            { "name" : "second",
            "type" : "proxy",
            "ip : 71.78.22.43
            }
        ]
    }
```
  Нужно найти и исправить все ошибки, которые допускает наш сервис
  Ответ: пропущены ковычки "ip" : "71.78.22.43"

## Обязательная задача 2
В прошлый рабочий день мы создавали скрипт, позволяющий опрашивать веб-сервисы и получать их IP. К уже реализованному функционалу нам нужно добавить возможность записи JSON и YAML файлов, описывающих наши сервисы. Формат записи JSON по одному сервису: `{ "имя сервиса" : "его IP"}`. Формат записи YAML по одному сервису: `- имя сервиса: его IP`. Если в момент исполнения скрипта меняется IP у сервиса - он должен так же поменяться в yml и json файле.

### Ваш скрипт:
```python
#!/usr/bin/env python3

import socket
import pickle
import yaml
import json

hosts = ['drive.google.com', 'mail.google.com', 'google.com']
outForm = '[ERROR] {} IP mismatch: {} {}'
ips = {}
flag = True

try:
    with open('lastips', 'rb') as f:
        lastips = pickle.load(f)
except FileNotFoundError:
    flag = False

for host in hosts:
    ip = socket.gethostbyname(host)
    if flag and lastips[host] != ip:
        print(outForm.format(host, lastips[host], ip))
    else:
        print(host+' - '+ip)
    ips[host] = ip

with open('host.yml', 'w') as f:
    f.write(yaml.dump(ips))
    #f.write(yaml.dump(list(map(lambda x: x+':'+ips[x], ips))))

with open('host.json', 'w') as f:
    f.write(json.dumps(ips))

with open('lastips', 'wb') as f:
    pickle.dump(ips, f)

```

### Вывод скрипта при запуске при тестировании:
```
drive.google.com - 74.125.131.194
mail.google.com - 173.194.73.18
google.com - 64.233.165.100

```

### json-файл(ы), который(е) записал ваш скрипт:
```json
{"drive.google.com": "74.125.131.194", "mail.google.com": "173.194.73.18", "google.com": "64.233.165.100"}
```

### yml-файл(ы), который(е) записал ваш скрипт:
```yaml
drive.google.com: 74.125.131.194
google.com: 64.233.165.100
mail.google.com: 173.194.73.18
```
