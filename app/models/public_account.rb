class PublicAccount < ActiveRecord::Base
	#  自定义菜单
	has_many :diymenus, dependent: :destroy

	# 当前公众账号的所有父级菜单
	has_many :parent_menus, ->{includes(:sub_menus).where(parent_id: nil, is_show: true).order("sort").limit(3)}, class_name: "Diymenu", foreign_key: :public_account_id

	def build_menu
		Jbuilder.encode do |json|
			json.button (parent_menus) do |menu|
				json.name menu.name
				if menu.has_sub_menu?
					json.sub_button(menu.sub_menus) do |sub_menu|
						json.type sub_menu.type
						json.name sub_menu.name
						sub_menu.button_type(json)
					end
				else
					json.type menu.type
					menu.button_type(json)
				end
			end
		end
	end
end
