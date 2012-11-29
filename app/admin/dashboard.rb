ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do

    div :class => "panel"  do
        h3 {"Recent Products"}

        div :class => "panel_contents" do
            table_for Product.order("created_at desc").limit(5) do
                column :name do |product|
                    link_to product.name, [:admin, product]
                end 
                column :created_at

            end
            strong { link_to "View All Products", admin_products_path }
        end
        
    end

    
    div :class => "panel"  do
        h3 {"Recent Customers"}

        div :class => "panel_contents" do
            table_for Order.order("created_at desc").limit(10) do
                column :first_name do |order|
                    link_to order.first_name, [:admin, order]
                end 

                column :last_name do |order|
                    link_to order.last_name, [:admin, order]
                end 

                column "Ordered On", :created_at

            end
            strong { link_to "View All Sold Products", "admin_orders_path" }
        end
    end
    

    div :class => "panel"  do
        h3 {"Newest Registered Customers"}

        div :class => "panel_contents" do
            table_for User.order("created_at desc").limit(10) do
                column :first_name do |order|
                    link_to order.first_name, [:admin, order]
                end 

                column :last_name do |order|
                    link_to order.last_name, [:admin, order]
                end 

                column "Signed Up On", :created_at

            end
            strong { link_to "View All Users", "admin_users_path" }
        end
    end




    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
