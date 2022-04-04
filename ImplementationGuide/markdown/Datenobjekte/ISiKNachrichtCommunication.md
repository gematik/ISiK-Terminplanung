## ISiKNachricht [(Communication)](http://hl7.org/fhir/communication.html)

---

### Motivation

Die Communication-Ressource dient als Datenobjekt für den Austausch von Nachrichten zwischen einer Leistunserbringer:in und einer Patient:in. Es können Textnachrichten als auch Binärdateien ausgetauscht werden.

---

### Kompabilität

Siehe {{pagelink:ImplementationGuide/markdown/UebergreifendeFestlegungen/Kompatibilitaet.md, text:Kompabilität}}.

---

### FHIR-Profil

@```
from StructureDefinition where url = 'https://gematik.de/fhir/ISiK/v2/StructureDefinition/ISiKNachricht' select Name: name, Canonical: url
```

{{tree:https://gematik.de/fhir/ISiK/v2/StructureDefinition/ISiKNachricht, hybrid}}

Folgende FHIRPath-Constraints sind im Profil zu beachten:

@``` from StructureDefinition where url = 'https://gematik.de/fhir/ISiK/v2/StructureDefinition/ISiKNachricht' for differential.element.constraint select key, severity, human, expression```

---

### Anmerkungen zu Must-Support-Feldern

### `Communication.subject`

**Bedeutung** Patient-Referenz als Aussage für welche Patient:in die Communication verfasst wird

**Hinweis** Ein Patientenbezug muss stets gegeben sein, soweit möglich.

### `Communication.recipient`

**Bedeutung** Empfänger der Communication

**Hinweis** Für Practitioner und HealthcareService muss Reference.reference angegeben werden. Für weitere Ressourcen MUSS ein Referenze.display angegeben werden.

### `Communication.payload`

**Bedeutung** Inhalt der Communication

**Hinweis** Es MÜSSEN Freitext, als auch base64-kodierte Inhalte unterstützt werden. Im Falle das strukturierte Metadaten über das zu übermittelnde Dokument verfügbar sind, KANN es als DocumentReference-Ressource abgelegt wird. Für die Anlage einer solchen Ressource wird auf das [ISiK Dokumentenaustausch](https://simplifier.net/guide/isik-dokumentenaustausch) verwiesen. Die erzeugte Ressource ist anschließend unter dem contentReference-Element als Referenz anzugeben. Jegliche Funktionalität bezogen auf das Modul Dokumentenaustausch ist nicht bestätigungsrelevant. Dokumente welche als Attachment angegeben werden, MÜSSEN in ihrer URL auf eine Binary Ressource verweisen.

---

### Interaktionen

Für die Ressource Communication MUSS die REST-Interaktion "READ" implementiert werden.

1. Der Suchparameter "_id" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Communication?_id=103270```

    Anwendungshinweise: Weitere Informationen zur Suche nach "_id" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).

1. Der Suchparameter "subject" MUSS unterstützt werden:

    Beispiele

    ```GET [base]/Slot?subject=Patient/ISiKPatientExample```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Slot.subject" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference)

1. Der Suchparameter "recipient" MUSS unterstützt werden:

    Beispiele

    ```GET [base]/Slot?recipient=Practitioner/ISiKPractitionerExample```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Slot.subject" finden sich in der [FHIR-Basisspezifikation - Abschnitt "reference"](http://hl7.org/fhir/R4/search.html#reference)


---

### Beispiele

{{json:ISiKNachrichtExample}}