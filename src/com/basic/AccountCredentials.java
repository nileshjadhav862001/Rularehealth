package com.basic;

public class AccountCredentials 
{
	public static String email;
	public static String password;
	public static int id;
	public static String disease;
	public static int av_id;
	public static int doctor_id;
	public static int patient_id;
	public static String patient_name;
	
	public static String getPatient_name() {
		return patient_name;
	}
	public static void setPatient_name(String patient_name) {
		AccountCredentials.patient_name = patient_name;
	}
	public static int getPatient_id() {
		return patient_id;
	}
	public static void setPatient_id(int patient_id) {
		AccountCredentials.patient_id = patient_id;
	}
	public static String getEmail() {
		return email;
	}
	public static void setEmail(String email) {
		AccountCredentials.email = email;
	}
	public static String getPassword() {
		return password;
	}
	public static void setPassword(String password) {
		AccountCredentials.password = password;
	}
	public static int getId() {
		return id;
	}
	public static void setId(int id) {
		AccountCredentials.id = id;
	}
	public static String getDisease() {
		return disease;
	}
	public static void setDisease(String disease) {
		AccountCredentials.disease = disease;
	}
	public static int getAv_id() {
		return av_id;
	}
	public static void setAv_id(int av_id) {
		AccountCredentials.av_id = av_id;
	}
	public static int getDoctor_id() {
		return doctor_id;
	}
	public static void setDoctor_id(int doctor_id) {
		AccountCredentials.doctor_id = doctor_id;
	}
}
