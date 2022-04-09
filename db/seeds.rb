service_type = [
"Laboratory Facility",
"Medical Consultation",
"Electrocardiogram",
"Dental Services",
"Pre Employment Medical Examination",
"Seafarer's Medical Examination",
"Ultrasound",
"RTPCR Testing"
]
Admin.create(email: ENV["EMAIL"], password: ENV["PASSWORD"], name: ENV["USERNAME"])
service_type.each do |service|
    Service.create(name: service)
end
