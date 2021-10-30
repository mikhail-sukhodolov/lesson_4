class Train

# имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов, эти данные указываются при создании экземпляра класса, может набирать скорость и возвращать текущую скорость, может возвращать количество вагонов

  attr_accessor :speed, :station, :route
  attr_reader :wagons


  def initialize(number, type, wagons, speed = 0)
    @number = number
    @type = type
    @wagons = wagons
    @speed = speed
  end

# может тормозить (сбрасывать скорость до нуля)
  def stop
    self.speed = 0
  end

# может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или уменьшает количество вагонов). Прицепка/отцепка вагонов может осуществляться только если поезд не движется
  def add_wagons
     @wagons +=1 if @speed == 0
  end

  def  delete_wagons
    @wagons -=1 if @speed == 0 && wagons > 1
  end

# может принимать маршрут следования (объект класса Route), при назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
  def add_route(route)
    @route = route
    self.station = self.route.station_list.first
  end
    
# может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад, но только на 1 станцию за раз, возвращать предыдущую станцию, текущую, следующую, на основе маршрута
  def next_station
    self.route.station_list[self.route.station_list.index(self.station) + 1]
  end

  def prev_station
    self.route.station_list[self.route.station_list.index(self.station) - 1]
  end

  def cur_station
    self.route.station_list[self.route.station_list.index(self.station)]
  end

  
  def move_forward
    self.station = next_station if cur_station != self.route.station_list.last
  end

  def move_back
    self.station = prev_station if cur_station != self.route.station_list.first
  end  	  

end
