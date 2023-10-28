require_relative "app/models/patient"
require_relative "app/models/room"
require_relative "app/repositories/patient_repository"

# jane = Patient.new(name: "Jane", cured: false)
# vincent = Patient.new(name: "Vincent", cured: false)
# tiger = Patient.new(name: "Tiger", cured: false, address: "")
# # p jane

# vip_room = Room.new(capacity: 2)

# vip_room.add_patient(jane)
# vip_room.add_patient(tiger)
# p vip_room.full?
# vip_room.add_patient(vincent)
# p vip_room
# p jane.room

file = "data/patients.csv"
patient_repo =  PatientRepository.new(file)

p martin = Patient.new(name: "Martin", cured: false)
patient_repo.create(martin)
p martin

p martin = Patient.new(name: "Martin", cured: false)
patient_repo.create(martin)
p martin

p patient_repo
