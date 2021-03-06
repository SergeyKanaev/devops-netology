Домашняя работа к занятию "5.5. Оркестрация кластером Docker контейнеров на примере Docker Swarm"


Задача 1

Дайте письменые ответы на следующие вопросы:

• В чём отличие режимов работы сервисов в Docker Swarm кластере: replication и global?
      
Ответ:

В replication мы указываем конкретное циферное обозначение количества наших реплик, мы можем запустить любое кол-во микросервисов при достаточной вычислительной мощьности. В global - на всех нодах Docker Swarm, на одном и том же порту запускается микросервис, выполняется одна задача на каждом узле. Хороший вариант для запуска в  global, мониторинговые процессы и антивирусные сканеры.       
    
• Какой алгоритм выбора лидера используется в Docker Swarm кластере?
      
Ответ:

Менеджерится с помощью алгоритма Raft, протокол для реализации распределенного консенсуса. В случае сбоя любой узел диспетчера может взять на себя задачи и восстановить службы в стабильное состояние 
    
• Что такое Overlay Network?
      
Ответ:
 
Overlay Network создает подсеть, которую могут использовать контейнеры в разных хостах swarm-кластера. Контейнеры на разных физических хостах могут обмениваться данными по overlay network (если все они прикреплены к одной сети). Когда мы запускаем контейнер на swarm-кластере (как часть сервиса), множество сетей присоединяется по умолчанию, и каждая из них соответствует разным требованиям связи.

Задача 2

Создать ваш первый Docker Swarm кластер в Яндекс.Облаке
Для получения зачета, вам необходимо предоставить скриншот из терминала (консоли), с выводом команды:
   
     docker node ls

Ответ: ![image](https://user-images.githubusercontent.com/91260493/154843599-0ea0fa06-2b3d-41d4-85dd-9dfd6f3bd4b2.png)


Задача 3

Создать ваш первый, готовый к боевой эксплуатации кластер мониторинга, состоящий из стека микросервисов.
Для получения зачета, вам необходимо предоставить скриншот из терминала (консоли), с выводом команды:

      docker service ls
      
Ответ: ![image](https://user-images.githubusercontent.com/91260493/154843670-6f8bb198-36c8-401b-9e72-b0340396718f.png)


Задача 4 (*)

Выполнить на лидере Docker Swarm кластера команду (указанную ниже) и дать письменное описание её функционала, что она делает и зачем она нужна:

      docker swarm update --autolock=true
      
Ответ:  ![image](https://user-images.githubusercontent.com/91260493/154843750-445a25a5-fd2c-4a8e-b2e3-5d0bb4dc6e4f.png)

Raft logs, используемые менеджерами swarm, по умолчанию зашифрованы на диске. Когда демон Docker перезапускается, ключ TLS(transport layer security), используемый для шифрования связи между узлами swarm, и ключ, используемый для шифрования и дешифрования Raft logs на диске, загружаются в память каждого узла диспетчера. Docker защищает эти ключи, позволяя нам стать их владельцами, и мы вручную можем разблокировать узел swarm manager. Это функция автоматической блокировки docker swarm.

