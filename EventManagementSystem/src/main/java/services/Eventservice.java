package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import models.Event;

public class Eventservice {

    private Connection conn;

    public Eventservice(Connection conn) {
        this.conn = conn;
    }

    public boolean addEvent(Event emp) {
        boolean f = false;
        try {
            String sql = "INSERT INTO event (eventid, eventname, organizer, location, description, date, time, attendeeslimit, contactemail, contactphone) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pmst = conn.prepareStatement(sql);
            pmst.setString(1, emp.getEventId());
            pmst.setString(2, emp.getEventName());
            pmst.setString(3, emp.getOrganizer());
            pmst.setString(4, emp.getLocation());
            pmst.setString(5, emp.getDescription());
            pmst.setString(6, emp.getDate());
            pmst.setString(7, emp.getTime());
            pmst.setInt(8, emp.getAttendeesLimit());
            pmst.setString(9, emp.getContactEmail());
            pmst.setString(10, emp.getContactPhone());

            int i = pmst.executeUpdate();
            f = i == 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public List<Event> getAllEvents() {
        List<Event> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM event";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Event emp = new Event();
                emp.setEventId(rs.getString("eventid"));
                emp.setEventName(rs.getString("eventname"));
                emp.setOrganizer(rs.getString("organizer"));
                emp.setLocation(rs.getString("location"));
                emp.setDescription(rs.getString("description"));
                emp.setDate(rs.getString("date"));
                emp.setTime(rs.getString("time"));
                emp.setAttendeesLimit(rs.getInt("attendeeslimit"));
                emp.setContactEmail(rs.getString("contactemail"));
                emp.setContactPhone(rs.getString("contactphone"));
                list.add(emp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Event getByEventId(String eventId) {
        Event emp = null;
        try {
            String sql = "SELECT * FROM event WHERE eventid = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, eventId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                emp = new Event();
                emp.setEventId(rs.getString("eventid"));
                emp.setEventName(rs.getString("eventname"));
                emp.setOrganizer(rs.getString("organizer"));
                emp.setLocation(rs.getString("location"));
                emp.setDescription(rs.getString("description"));
                emp.setDate(rs.getString("date"));
                emp.setTime(rs.getString("time"));
                emp.setAttendeesLimit(rs.getInt("attendeeslimit"));
                emp.setContactEmail(rs.getString("contactemail"));
                emp.setContactPhone(rs.getString("contactphone"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return emp;
    }

    public boolean updateEvent(Event emp) {
        boolean f = false;
        try {
            String sql = "UPDATE event SET eventname=?, organizer=?, location=?, description=?, date=?, time=?, contactphone=? WHERE eventid=?";
            PreparedStatement pmst = conn.prepareStatement(sql);
            pmst.setString(1, emp.getEventName());
            pmst.setString(2, emp.getOrganizer());
            pmst.setString(3, emp.getLocation());
            pmst.setString(4, emp.getDescription());
            pmst.setString(5, emp.getDate());
            pmst.setString(6, emp.getTime());
            pmst.setString(7, emp.getContactPhone());
            pmst.setString(8, emp.getEventId());

            int i = pmst.executeUpdate();
            f = (i == 1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }


    public boolean deleteEvent(String eventId) {
        boolean f = false;
        try {
            String sql = "DELETE FROM event WHERE eventid=?";
            PreparedStatement pmst = conn.prepareStatement(sql);
            pmst.setString(1, eventId);
            int i = pmst.executeUpdate();
            f = i == 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public boolean register(Event emp) {
        boolean f = false;
        try {
            String sql = "INSERT INTO registration (email, password) VALUES (?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, emp.getContactEmail());
            ps.setString(2, emp.getPassword());
            int i = ps.executeUpdate();
            f = i == 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public boolean login(String email, String password) {
        boolean isValid = false;
        try {
            String sql = "SELECT * FROM registration WHERE email = ? AND password = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                isValid = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isValid;
    }

}
