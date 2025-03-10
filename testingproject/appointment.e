note
	description: "Summary description for {APPOINTMENT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
    APPOINTMENT

create
    make

feature -- Initialization

    make (a_patient_id, a_doctor_id: INTEGER; an_appointment_date: STRING)
        -- Initialize an appointment.
    do
        patient_id := a_patient_id
        doctor_id := a_doctor_id
        date := an_appointment_date
    end

feature -- Attributes

    patient_id: INTEGER
    doctor_id: INTEGER
    date: STRING

end
