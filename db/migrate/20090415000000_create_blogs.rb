class CreateBlogs < ActiveRecord::Migration
  def self.up
    create_versioned_table :blogs do |t|
      t.string :name
      t.string :format
      t.text :template
    end
    
    create_versioned_table :blog_group_memberships do |t|
      t.integer :blog_id
      t.integer :group_id
    end
    
    ContentType.create!(:name => "Blog", :group_name => "Blog")
    
    blog_page = Page.first(:conditions => {:path => "/"})
      
    Blog.create!(
      :name => "My Blog",
      :template => Blog.default_template,
      :connect_to_page_id => blog_page.id,
      :connect_to_container => "main",
      :groups => [Group.find_by_code("cms-admin"), Group.find_by_code("content-editor")],
      :publish_on_save => true)
  end

  def self.down
    PageRoute.destroy_all(:pattern => ["/articles/tag/:tag", "/articles/category/:category"])
    ContentType.destroy_all(:name => "Blog")
    Connector.destroy_all(:connectable_type => "Blog")

    drop_table :blog_versions
    drop_table :blogs

    drop_table :blog_group_membership_versions
    drop_table :blog_group_memberships
  end
end
