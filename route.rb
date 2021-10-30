class Route

# имеет начальную и конечную станцию, а также список промежуточных станций. Начальная и конечная станции указываютсся при создании маршрута, а промежуточные могут добавляться между ними
  attr_accessor :station_list

  def initialize (first_station, last_station)
    @station_list = [first_station, last_station]
  end

  def add_station(station)
    self.station_list.insert(-2,station)
  end

# может удалять промежуточную станцию из списка
  def delete_station(station)
    self.station_list.delete(station)
  end

# может выводить список всех станций по-порядку от начальной до конечной
  def all_station
    puts @station_list
  end
end
