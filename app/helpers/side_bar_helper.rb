module SideBarHelper
  def side_bar_items(ru)
    result = []
    result << {
      :name => 'Сслыка без детей',
      :icon => 'bed',
      :controller => :welcome,
      :action => :index
    }
    result << {
      :name => 'Администрирование',
      :icon => 'users',
      :children => [
      {:name => 'Пользователи',
       :controller => :users, :action => :index,
       :icon => 'users',
       :class => 'long'},
      {:name => 'Добавление',
       :controller => :users, :action => :new,
       :icon => 'user-plus'},
      {:name => 'Роли',
       :controller => :roles, :action => :index,
       :icon => 'align-center',
       :class => 'long'},
    ]}
    result << {
      :name => 'Модели',
      :icon => 'vcard',
      :children => [
      {:name => 'Поиск',
       :controller => :books, :action => :search,
       :icon => 'search'},
      {:name => 'Книги',
       :controller => :books, :action => :index,
       :icon => 'book'},
      {:name => 'Стеллажи',
       :controller => :shelves, :action => :index,
       :icon => 'archive',
       :class => 'long'}
    ]}
    result << {
      :name => 'Скаффолды',
      :icon => 'list',
      :children => [
        {:name => 'Залы',
        :controller => :halls, :action => :index,
        :icon => 'hospital-o',
        :class => 'long'},
        {:name => 'Стеллажи',
        :controller => :shelves, :action => :index,
        :icon => 'archive'},
        {:name => 'Авторы',
        :controller => :authors, :action => :index,
        :icon => 'user-circle-o'},
        {:name => 'Книги',
        :controller => :books, :action => :index,
        :icon => 'book'},
        {:name => 'Расположение книг',
        :controller => :locations, :action => :index,
        :icon => 'search'}
      ]
    }
    result
  end

  def is_open?(ctr, act)
    case ctr.to_s
    when 'users', 'roles'
      ctr.to_s == controller_name.to_s
    else
      false
    end
  end
end
