note
	description: "Summary description for {APPOINTMENT_LIST}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"
class
    APPOINTMENT_LIST

create
    make

feature -- Initialization

    make
            -- Create an empty appointment list.
        do
            create appointments.make (10)  -- Initial capacity of 10
        end

feature -- Basic Operations

    extend (patient_id, doctor_id: INTEGER; appointment_date: STRING)
            -- Add a new appointment.
        local
            appointment: TUPLE [patient_id: INTEGER; doctor_id: INTEGER; date: STRING]
        do
            appointment := [patient_id, doctor_id, appointment_date]
            appointments.extend (appointment)
        end

    update_appointment (index: INTEGER; patient_id, doctor_id: INTEGER; appointment_date: STRING)
            -- Update an existing appointment at a given index.
        local
            appointment: TUPLE [patient_id: INTEGER; doctor_id: INTEGER; date: STRING]
        do
            if appointments.valid_index (index) then
                appointment := [patient_id, doctor_id, appointment_date]
             
                io.put_string ("Appointment updated successfully.%N")
            else
                io.put_string ("Invalid appointment index.%N")
            end
        end

    delete_appointment (index: INTEGER)
            -- Delete an appointment at a given index.
        do
            if appointments.valid_index (index) then
                appointments.remove_i_th (index)
                io.put_string ("Appointment deleted successfully.%N")
            else
                io.put_string ("Invalid appointment index.%N")
            end
        end

    display_all
            -- Display all appointments.
        local
            appointment: TUPLE [patient_id: INTEGER; doctor_id: INTEGER; date: STRING]
            i: INTEGER
        do
            from
                i := appointments.lower
            until
                i > appointments.upper
            loop
                appointment := appointments.i_th (i)
                io.put_string ("Appointment Index: " + i.out + "%N")
                io.put_string ("Patient ID: " + appointment.patient_id.out + "%N")
                io.put_string ("Doctor ID: " + appointment.doctor_id.out + "%N")
                io.put_string ("Date: " + appointment.date + "%N")
                io.put_string ("------------------------------------%N")
                i := i + 1
            end
        end

feature -- Data

    appointments: ARRAYED_LIST [TUPLE [patient_id: INTEGER; doctor_id: INTEGER; date: STRING]]

end
