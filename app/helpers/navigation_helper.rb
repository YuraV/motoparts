module NavigationHelper
  def main_navigation_groups
    nav_groups = [{items: [nav_item_for(root_path)]}]

    categories_group = []
    # categories_group << nav_item_for(categories_path, :highlights_on => :subpath)
    categories.each do |category|
      folders = []
      category.folders.each do |folder|
        folders << nav_item_for(category_folder_path(category, folder), name: folder.name, class: 'folder')
      end
      categories_group << nav_item_for(category_path(category), name: category.name, items: folders, class: 'category')
    end
    nav_groups << {title: 'Categories', items: categories_group}
    # if Hypervisor.authorized_for?(current_user, :read, :scope => :all)
    #   hypervisor_items = []
    #   hypervisor_items << nav_item_for('/hypervisors', :name => t('.all_hypervisors'))
    #   HypervisorGroup.includes(:hypervisors).each do |group|
    #     group_items = group.hypervisors.map do |hypervisor|
    #       nav_item_for(hypervisor_vm_path(hypervisor), :key => "hypervisor_#{hypervisor.id}", :name => hypervisor.label, :class => 'hypervisor')
    #     end
    #     hypervisor_items << nav_item_for('#', :key => "group_#{group.id}", :name => group.label, :items => group_items, :skip_icon => true, :class => 'group', :link => {:class => 'nav_arrow icon'})
    #   end
    #   appliances_group << nav_item_for('/hypervisors', :items => hypervisor_items, :link => {:class => 'nav_arrow icon'})
    #   appliances_group << nav_item_for(not_grouped_hypervisor_vms_path, :key => 'unassigned_hvs', :name => t('.unassigned_hypervisors')) if hypervisors_not_grouped?
    # end
    #
    # if OnApp.configuration.storage_enabled && current_user.has_permission?(:integrated_storage)
    #   storage_items = []
    #   Storage::Endpoint.possible_zones.each do |zone_id, name|
    #     endpoint = Storage::Endpoint.new(zone_id: zone_id)
    #     group_items = []
    #     group_items << nav_item_for(polymorphic_path([endpoint, :storage_data_stores]), name: t('.storage/data_stores')) unless endpoint.unassigned?
    #     group_items << nav_item_for(polymorphic_path([endpoint, :storage_nodes]), name: t('.storage/nodes'))
    #     group_items << nav_item_for(polymorphic_path([endpoint, :storage_health_checks]), name: t('.storage/diagnostics')) unless endpoint.unassigned?
    #     storage_items << nav_item_for('#', key: "endpoint_#{zone_id}", name: name, items: group_items, link: { class: 'nav_arrow icon' }, skip_icon: true)
    #   end
    #   appliances_group << nav_item_for('#', items: storage_items, link: { class: 'nav_arrow icon' }, name: t('.integrated_storage'), class: 'integrated_storage')
    # end




    # components_group = []
    # if current_user.has_any_permission?(DnsZone, :read, scopes: :own) && OnApp.dns_configuration.enabled?
    #   components_group << nav_item_for(dns_zones_path, :t => 'dns', :highlights_on => :subpath, :counter => navigation_counters.dns_zones_count)
    # end
    #
    # can_read_image_templates       = current_user.has_any_permission?(ImageTemplate, :read, :inactive, scopes: [:own, :public, :user])
    # can_read_template_isos         = current_user.has_any_permission?(ImageTemplateIso, :read, :inactive, scopes: [:own, :public, :user])
    # can_read_image_templates_store = ImageTemplateGroup.authorized_for?(current_user, :read, scope: :all)
    # can_read_own_template_groups = ImageTemplateGroup.authorized_for?(current_user, :read, scope: :own)
    # can_read_license = current_user.has_permission?(:dashboard, :licensing)
    #
    # if can_read_image_templates ||
    #     can_read_template_isos  ||
    #     can_read_image_templates_store ||
    #     can_read_license
    #
    #   template_items = []
    #   templates_link = nil
    #
    #   if can_read_image_templates
    #     template_items << nav_item_for(image_templates_path, :t => 'templates_list', :class => 'template_list', :highlights_on => :subpath, :counter => navigation_counters.image_templates_count)
    #     templates_link ||= image_templates_path
    #   end
    #
    #   if can_read_template_isos
    #     template_items << nav_item_for(image_template_isos_path, :t => 'template_isos_list', :class => 'template_iso_list', :highlights_on => :subpath, :counter => navigation_counters.image_template_isos_count)
    #     templates_link ||= image_templates_path
    #   end
    #
    #   if can_read_image_templates_store
    #     template_items << nav_item_for(template_store_path, :highlights_on => :subpath, :class => 'template_store', :counter => navigation_counters.template_store_count)
    #     templates_link ||= template_store_path
    #   end
    #
    #   if can_read_own_template_groups
    #     template_items << nav_item_for(own_image_template_groups_path, :highlights_on => :subpath, :class => 'template_store', :counter => navigation_counters.custom_template_store_count)
    #     templates_link ||= own_image_template_groups_path
    #   end
    #
    #   if can_read_license
    #     template_items << nav_item_for(software_licenses_path, :highlights_on => :subpath, :counter => navigation_counters.software_licenses_count)
    #     templates_link ||= software_licenses_path
    #   end
    #
    #   components_group << nav_item_for(templates_link, :t => 'templates', :items => template_items, :class => 'templates', :link => {:class => 'nav_arrow icon'})
    # end
    #
    # can_read_blueprint_templates = BlueprintTemplate.authorized_for?(current_user, :read)
    # can_read_blueprint_templates_store = BlueprintTemplateGroup.authorized_for?(current_user, :list)
    # if  can_read_blueprint_templates || can_read_blueprint_templates_store
    #   blueprint_items = []
    #   if can_read_blueprint_templates
    #     blueprint_items << nav_item_for(blueprint_templates_path, :highlights_on => :subpath, :counter => navigation_counters.blueprint_templates_count)
    #   end
    #   if can_read_blueprint_templates_store
    #     blueprint_items << nav_item_for(blueprint_template_groups_path, :highlights_on => :subpath, :class => 'blueprint_template_store', :counter => navigation_counters.blueprint_template_groups_count)
    #   end
    #   components_group << nav_item_for('#', :t => 'blueprints', :items => blueprint_items, :class => 'blueprints', :link => {:class => 'nav_arrow icon'})
    # end
    #
    #
    # can_read_recipe = Recipe.authorized_for?(current_user, :read)
    # can_read_recipe_group = RecipeGroup.authorized_for?(current_user, :read)
    # if can_read_recipe || can_read_recipe_group
    #   recipe_items = []
    #   if can_read_recipe
    #     recipe_items << nav_item_for(recipes_path, :highlights_on => :subpath, :counter => navigation_counters.recipes_count)
    #   end
    #   if can_read_recipe_group
    #     recipe_items << nav_item_for(recipe_groups_path, :highlights_on => :subpath, :counter => navigation_counters.recipe_groups_count)
    #   end
    #   components_group << nav_item_for(recipes_path, :t => 'recipes', :items => recipe_items, :class => 'recipes recipes_parent', :link => {:class => 'nav_arrow icon'})
    # end
    #
    # nav_groups << {title: 'components', items: components_group}
    #
    # if allow_manage_aws?
    #   aws_group = []
    #   aws_group << nav_item_for(ec2_instances_path(region_id: region_id), :highlights_on => :subpath, class: 'virtual_machines')
    #
    #   nav_groups << {title: 'aws', items: aws_group}
    # end
    #
    # cdn_group = []
    # if EdgeGroup.authorized_for?(current_user, :read) and @application_state.cdn_enabled?
    #   cdn_group << nav_item_for(edge_groups_path, :highlights_on => :subpath, counter: navigation_counters.edge_groups_count)
    # end
    #
    # if EdgeServer.authorized_for?(current_user, :read)
    #   cdn_group << nav_item_for(edge_servers_path(:type => "all"), :highlights_on => /^\/edge_servers/, :counter => navigation_counters.edge_servers_count)
    # end
    #
    # if StorageServer.authorized_for?(current_user, :read) and @application_state.cdn_enabled?
    #   cdn_group << nav_item_for(storage_servers_path, :highlights_on => :subpath, counter: navigation_counters.storage_servers_count)
    # end
    #
    # if CdnResource.authorized_for?(current_user, :read) and @application_state.cdn_enabled?
    #   cdn_group << nav_item_for(cdn_resources_path, :highlights_on => /^\/cdn_resources/, counter: navigation_counters.cdn_resources_count)
    # end
    #
    # if CdnSslCertificate.authorized_for?(current_user, :read)
    #   cdn_group << nav_item_for(cdn_ssl_certificates_path, :highlights_on => /^\/cdn_ssl_certificates/, counter: navigation_counters.cdn_ssl_certificates_count)
    # end
    #
    # nav_groups << {title: 'cdn', items: cdn_group}
    #
    # users_group = []
    # user_can_view_other = current_user.has_permission?(User, :read) ||
    #     current_user.has_permission?(UserGroup, :list)
    #
    # if user_can_view_other || (@application_state.cdn_enabled? &&
    #     EdgeGroup.authorized_for?(current_user, :read))
    #
    #   options = {:t => 'users_and_groups'}
    #
    #   if user_can_view_other
    #     options[:counter] = navigation_counters.users_count
    #   end
    #   users_group << nav_item_for(users_groups_path, options)
    # end
    #
    # if Role.authorized_for?(current_user, :read) ||
    #     Restrictions::Set.authorized_for?(current_user, :read)
    #   users_group << nav_item_for(roles_sets_path, :t => 'roles_and_sets', :counter => navigation_counters.roles_count, highlights_on: /^\/roles/)
    # end
    #
    # if Billing::Plan.authorized_for?(current_user, :read)
    #   users_group << nav_item_for(billing_plans_path, :t => 'billing_plans', :highlights_on => /^\/billing_plans/, :counter => navigation_counters.billing_plans_count)
    # end
    #
    # if InstanceType.authorized_for?(current_user, :read)
    #   users_group << nav_item_for(instance_types_path, t: 'instance_types', highlights_on: /^\/instance_types/, counter: navigation_counters.instance_types_count)
    # end
    #
    # nav_groups << {title: 'users', items: users_group}
    #
    # tools_group = []
    # if current_user.has_permission?(:settings, :read)
    #   tools_group << nav_item_for(settings_path, :highlights_on => /^\/settings|themes|autobackup_presets|data_store_zones|network_zones|backup_server_zones|internationalization/)
    # end
    # tools_group << nav_item_for(log_items_path, :t => 'logs', :highlights_on => :subpath) if LogItem.authorized_for?(current_user, :list)
    #
    # if VmHourlyStat.authorized_for?(current_user, :read) ||
    #     (current_user.has_permission?(UserHourlyStat, :read, scope: :own) &&
    #         @application_state.cdn_enabled?)
    #
    #   stats_items = []
    #   stats_items << nav_item_for(usage_statistics_path) if VmHourlyStat.authorized_for?(current_user, :read)
    #
    #   if current_user.has_permission?(UserHourlyStat, :read, scope: :own) &&
    #       @application_state.cdn_enabled?
    #     stats_items << nav_item_for(cdn_usage_statistics_path)
    #   end
    #
    #   stats_items << nav_item_for(top_iops_statistics_path) if IoStat.authorized_for?(current_user, :read)
    #   stats_link = if VmHourlyStat.authorized_for?(current_user, :read)
    #                  usage_statistics_path
    #                elsif current_user.has_permission?(UserHourlyStat, :read, scope: :own) &&
    #                    @application_state.cdn_enabled?
    #                  cdn_usage_statistics_path
    #                end
    #   tools_group << nav_item_for(stats_link, :t => 'stats', :items => stats_items, :class => 'stats', :link => {:class => 'nav_arrow icon'})
    # end
    #
    # tools_group << nav_item_for(sysadmin_tools_path) if current_user.has_permission?(:sysadmin_tool)
    # tools_group << nav_item_for(alerts_path, :t => 'alerts', :class => 'alerts') if current_user.has_permission?(:dashboard, :alerts)
    # tools_group << nav_item_for(help_path) if current_user.has_permission?(:help, :read)
    #
    # nav_groups << {title: 'tools', items: tools_group}

    nav_groups
  end

  def nav_item_for path, options = {}
    parsed_path = Rails.application.routes.recognize_path(path, :method => :get)
    item_controller = parsed_path[:controller]

    nav_key = options.delete(:key) || item_controller
    icon_class = 'icon' unless options.delete(:skip_icon)
    nav_title = options.delete(:name) || t(".#{options.delete(:t) || item_controller}")
    options[:"data-tooltip"] = nav_title
    nav_name  = content_tag(:span, nav_title, :class => icon_class)
    items = options.delete(:items)
    options[:class] = item_controller unless options[:class]

    if options[:counter]
      nav_name += content_tag(:span, options[:counter], class: 'count')
    end

    {:key => nav_key, :name => nav_name  , :url => path, :items => items, :options => options}
  end
end