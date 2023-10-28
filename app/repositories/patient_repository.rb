require 'csv'

class PatientRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    # @room_repository = room_repository # instance of room repository
    @patients = [] # patient instances
    @next_id = 1
    load_csv if File.exist?(@csv_file_path)
  end

  def create(patient)
    patient.id = @next_id
    @patients << patient
    @next_id += 1
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |attributes|
      # p attributes
      attributes[:id] = attributes[:id].to_i
                            # "false" == "true"    => false    
                            # "true" == "true"     => true
      attributes[:cured] = attributes[:cured] == "true"
      # example of patient has one room:
      # attributes[:room_id] = attributes[:room_id].to_i
      # hash[:new_key] = value
      # attributes[:room] = @room_repository.find(attributes[:room_id]) # instance of a room
      # p attributes
      @patients << Patient.new(attributes)
    end
    @next_id = @patients.any? ? @patients.last.id + 1 : @next_id
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << ['id', 'name', 'cured', 'room_id']
      @patients.each do |patient|
        csv << [patient.id, patient.name, patient.cured?, patient.room.id]
      end
    end
  end
end
