package models;

public class Event {

    private String eventId;
    private String eventName;
    private String organizer;
    private String location;
    private String description;
    private String date; // Format: YYYY-MM-DD
    private String time; // Format: HH:MM
    private int attendeesLimit;
    private String contactEmail;
    private String contactPhone;
    private String password; // ✅ NEW: for registration/login

    // --- Constructors ---
    public Event() {
        // default constructor
    }

    public Event(String eventId, String eventName, String organizer, String location, String description,
                 String date, String time, int attendeesLimit, String contactEmail, String contactPhone, String password) {
        this.eventId = eventId;
        this.eventName = eventName;
        this.organizer = organizer;
        this.location = location;
        this.description = description;
        this.date = date;
        this.time = time;
        this.attendeesLimit = attendeesLimit;
        this.contactEmail = contactEmail;
        this.contactPhone = contactPhone;
        this.password = password;
    }

    // --- Getters and Setters ---
    public String getEventId() {
        return eventId;
    }

    public void setEventId(String eventId) {
        this.eventId = eventId;
    }

    public String getEventName() {
        return eventName;
    }

    public void setEventName(String eventName) {
        this.eventName = eventName;
    }

    public String getOrganizer() {
        return organizer;
    }

    public void setOrganizer(String organizer) {
        this.organizer = organizer;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public int getAttendeesLimit() {
        return attendeesLimit;
    }

    public void setAttendeesLimit(int attendeesLimit) {
        this.attendeesLimit = attendeesLimit;
    }

    public String getContactEmail() {
        return contactEmail;
    }

    public void setContactEmail(String contactEmail) {
        this.contactEmail = contactEmail;
    }

    public String getContactPhone() {
        return contactPhone;
    }

    public void setContactPhone(String contactPhone) {
        this.contactPhone = contactPhone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
