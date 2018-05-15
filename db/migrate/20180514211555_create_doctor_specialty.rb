class CreateDoctorSpecialty < ActiveRecord::Migration[5.0]
  def change
    create_table :doctor_specialties do |t|
      t.references :doctor, foreign_key: true
      t.references :specialty, foreign_key: true
    end
  end
end
