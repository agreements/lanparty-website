class Team < ActiveRecord::Base
	attr_accessible :compo_id, :name, :user_ids

	validates_presence_of :name
	validates_presence_of :compo
	validate :users_must_not_be_participating
	validate :required_amount_of_users

	#validates :name, :uniqueness => {:scope => :compo}

	belongs_to :compo
	has_and_belongs_to_many :users

	def users_must_not_be_participating
		registered_users = compo.users
		invalid_users = users & registered_users
		errors.add(:users, "#{invalid_users.map{|x| x.username}.join(", ") }: already in the compo") unless invalid_users.empty?
	end

	def required_amount_of_users
		errors.add(:users, "Exaclty #{compo.group_size} users need to be selected") unless users.count == compo.group_size
	end

end
