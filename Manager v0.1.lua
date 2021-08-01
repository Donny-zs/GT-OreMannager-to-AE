local component = require("component")




--[[ обращение за всеми предметами в сети в виде таблицы с таблицами
component.me_controller.getItemsInNetwork()
getItemsInNetwork([filter:table]):table

можно сериализнуть в принципе, но бесперспективно
лучше прочёсывать через Pair


обращение к слотам конфигурации интерфейса

getInterfaceConfiguration([slot:number]):table
Get the configuration of the interface.
setInterfaceConfiguration([slot:number][, database:address, entry:number[, size:number]]):boolean

пример обращения к датабазе из под транспозера 

(запись)
component.transposer.store(сторона света транспозера с которой находитс интерфейс, номер слота интерфейса, адрес датабазы, номер слота датабазы )
вернёт булен, который скажет было там что-то или нет

(очистка)
component.database.clear(номер слота датабазы)
вернёт тру если что-то было стёрто

(для сравнения)
component.transposer.compareStackToDatabase(side:number, slot:number, dbAddress:string, dbSlot:number, checkNBT:boolean=false):boolean
compareStackToDatabase(1,2,db,3,false), где: 1 - сундук сверху, 2 - его второй слот который будет перебираться по хорошему, db переменная содержащая адресс датабазы,
3 слот этой датабазы, false проверять ли НБТ (урон или тип предмета в греге, вообще там надо проверять, так что там true надо)

Получить в виде таблицы все внутри инвенторя
component.transposer.getAllStacks(сторона транспозера):getAll()

------- Прочее
Одноблоки грегтека имеют неиспользуемые игроком слоты с 1 до 4
Транспозер не может взаимодействовать напрямую с одноблоками грега
