Instance: Book
InstanceOf: OperationDefinition
Usage: #example
* insert Meta-Inst
* id = "ISiKAppointmentBookOperation"
* url = "https://gematik.de/fhir/ISiK/v2/OperationDefinition/AppointmentBook"
* name = "ISiKAppointmentBookOperation"
* kind = #operation
* name = "book"
* code = #book
* resource = #Appointment
* system = false
* type = true
* instance = false
* affectsState = true
* description = "OperationDefinition für die Buchung eines Termins. Die Operation überprüft ob der Termin noch verfügbar ist im Termin-Repository."
* parameter[+]
  * name = #appt-resource
  * use = #in
  * min = 1
  * max = "1"
  * documentation	= "Eine Appointment-Ressource entsprechend dem dazugehörigen ISiK-Profil. Das Appointment MUSS den Status 'proposed' enthalten. Invalide Appointment-Ressourcen MÜSSEN mit einer OperationOutcome und dem Status Code HTTP 400 - Bad Request abgewiesen werden. Falls der Parameter als einzige Parameter verwendet wird KANN die Appointment-Ressource direkt im HTTP Body anstelle einer Parameter-Ressource übergeben werden."
  * type = #Appointment
  * targetProfile = Canonical(ISiKTermin)
* parameter[+]
  * name = #cancelled-appt-id
  * use = #in
  * min = 0
  * max = "1"
  * documentation	= "Für die vorliegende Spezifikation ist die Verschiebubng eines Termin eins zwei-stufiger Prozess, bei dem ein Termin storniert und ein neuer Termin neu gebucht wird. Dieser Parameter repräsentiert die Ressourcen-Id des stornierten Appointments. Der uri-Parameter kann eine absoulte URL enthalten, Server SOLLTEN jedoch nur Termine für ihre eigene Domäne verwalten. Im neu-angelegten Appointment MUSS eine Reference auf den abgesagten Termin hinterlegt werden. Der Status der abgesagten Ressource MUSS durch den Server angepasst werden."
  * type = #uri
* parameter[+]
  * name = #schedule
  * use = #in
  * min = 0
  * max = "1"
  * type = #Schedule
  * documentation	= "Im Falle das ein Appointment keine Referenz auf ein oder mehrere Slots enthält MUSS der Server die benötigten Slots auf Basis der Referenz auf Schedule, sowie dem Start- und Endzeitpunkt im Appointment ermitteln."
  * targetProfile = Canonical(ISiKKalender)
* parameter[+]
  * name = #return
  * use = #out
  * min = 0
  * max = "1"
  * documentation	= "Als Return-Parameter wird ein Bundle vom Typ 'searchset' zurückgegeben, welches eine aktualisierte Appointment- oder eine OperationOutcome-Ressource enthält. Im Falle das die Terminbuchung akzeptiert wird MUSS das Appointment persistiert werden. Das id-Element der Ressource MUSS korrekt gefüllt werden. Der Status der Appointment-Ressource muss auf 'booked' geändert werden. Der Server MUSS die verwendeten Slot-Ressourcen als Referenz im Appointment angeben."
  * type = #Bundle