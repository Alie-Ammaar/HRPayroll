class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role_id: [:Admin , :Manager , :Employee ]
  enum gender: [:Male , :Female ]
  enum user_title: [:Mr , :Miss, :Mrs , :Ms ]

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
