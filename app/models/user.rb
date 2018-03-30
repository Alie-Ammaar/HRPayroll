class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable,
				 :recoverable, :rememberable, :trackable, :validatable
	mount_uploader :passport_avatar, PassportAvatarUploader
	enum role_id: [:Admin , :Manager , :Employee ]
	enum gender: [:Male , :Female ]
	enum user_title: [:Mr , :Miss, :Mrs , :Ms ]

	has_many :log_activities

	def dob= date
		if date.present? && date.is_a?(String)
			self[:dob] = parse_date(date)
		elsif date.present? && date.is_a?(Date)
			self[:dob] = date
		else
			self[:dob] = nil
		end
	end

	def parse_date(date)
		Date.strptime(date, "%m/%d/%Y")
	end

	def is_admin?

		role_id == "Admin"

	end

	def is_manager?

		role_id == "Manager"

	end

	def is_employee?
		
		role_id == "Employee"

	end

	def full_name
		"#{titleize_string(user_title)} #{titleize_string(first_name)} #{titleize_string(middle_name)} #{titleize_string(surname)} "
	end

	def titleize_string(data)
		data.present? ? data.titleize : ""
	end
end
