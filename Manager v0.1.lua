--Установи ме интерфейс, к нему вплотную адаптер с датабазой внутри и транспозер. На транспозер сверху поставь обычный сундук, и с любой стороны один другой блок инвентаря 
--9й слой интерфейса необходимо оставлять пустым, туда транспозер будет сгружать результат работы

local component = require("component")



--Переменные и имена
local tr = component.transposer
local controller = component.me_controller

local ItemsInNetwork = {} --Массив для хранения содержимого АЕ


--Массив настроек, загружаемый из файла данных


local function Insert(sourceSide,sinkSide,count,sourceSlot,sinkSlot,countLimit) --Выводит из интерфейса транспозером в целевой интерфейс предмет с проверками
  if  countLimit > tr.getStackInSlot(2,7).size  then    --проверяет размер стака в интерфейсе
    return(false)
  end
  tr.transferItem(sourceSide,sinkSide,count,sourceSlot,sinkSlot)
  os.sleep(1)
  
  return(true) --По хорошему надо возвращать true замешанный на том что выдаёт transferItem - (counter == transferItem)
end

local function Eject(sourceSide,sinkSide,count,sourceSlot,sinkSlot,countLimit) --забирает из целевого интерфейса предмет
  tr.transferItem(sinkSide,sourceSide,count,sinkSlot,9) --Вынимает результат работы
end


local function SearchInAe()
ItemsInNetwork = controller.getItemsInNetwork()
  for i,v in pairs(coolPlace[i]) do

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

Получить в виде таблицы все внутри ме сети
component.me_controller.getItemsInNetwork()

------- Прочее
Одноблоки грегтека имеют неиспользуемые игроком слоты с 1 до 4
Транспозер может взаимодействовать напрямую с одноблоками грега но не может забирать из вводного слота что либо
