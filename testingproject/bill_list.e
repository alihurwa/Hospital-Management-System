note
	description: "Summary description for {BILL_LIST}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"
class
    BILL_LIST

create
    make

feature -- Initialization

    make
        -- Create an empty bill list.
    do
        create bills.make
    end

feature -- Basic Operations

    extend (patient_id, treatment_cost, medication_cost, room_charges, total_cost: INTEGER)
        -- Add a new bill.
        local
            bill: TUPLE [patient_id: INTEGER; treatment_cost: INTEGER; medication_cost: INTEGER; room_charges: INTEGER; total_cost: INTEGER]
        do
            create bill
            bill := [patient_id, treatment_cost, medication_cost, room_charges, total_cost]
            bills.extend(bill)
        end

    display_all
        -- Display all bills.
        local
            bill: TUPLE [patient_id: INTEGER; treatment_cost: INTEGER; medication_cost: INTEGER; room_charges: INTEGER; total_cost: INTEGER]
        do
            from
                bills.start
            until
                bills.after
            loop
                bill := bills.item
                io.put_string("Patient ID: " + bill.patient_id.out + "%N")
                io.put_string("Treatment Cost: $" + bill.treatment_cost.out + "%N")
                io.put_string("Medication Cost: $" + bill.medication_cost.out + "%N")
                io.put_string("Room Charges: $" + bill.room_charges.out + "%N")
                io.put_string("Total Cost: $" + bill.total_cost.out + "%N")
                io.put_string("------------------------------------%N")
                bills.forth
            end
        end

feature -- Data

    bills: LINKED_LIST [TUPLE [patient_id: INTEGER; treatment_cost: INTEGER; medication_cost: INTEGER; room_charges: INTEGER; total_cost: INTEGER]]

end
