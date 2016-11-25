# Preview all emails at http://localhost:3000/rails/mailers/doctor_mailer
class DoctorMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/doctor_mailer/account_activation
  def account_activation
  	doctor = Doctor.first
  	doctor.activation_token = Doctor.new_token
    DoctorMailer.account_activation(doctor)
  end

  # Preview this email at http://localhost:3000/rails/mailers/doctor_mailer/password_reset
  def password_reset
    doctor = Doctor.first
    doctor.reset_token = Doctor.new_token
    DoctorMailer.password_reset(doctor)
  end

end
