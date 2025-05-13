<?php

/** @noinspection all */
namespace Slowlyo\OwlAdmin\Controllers {

    /** @property \Slowlyo\OwlAdmin\Services\AdminUserService $service */
    class AuthController {}

    /** @property \Slowlyo\OwlAdmin\Services\AdminUserService $service */
    class AdminUserController {}

    /** @property \Slowlyo\OwlAdmin\Services\AdminMenuService $service */
    class AdminMenuController {}

    /** @property \Slowlyo\OwlAdmin\Services\AdminRoleService $service */
    class AdminRoleController {}

    /** @property \Slowlyo\OwlAdmin\Services\AdminPermissionService $service */
    class AdminPermissionController {}
}

namespace Slowlyo\OwlAdmin\Controllers\DevTools {

    /** @property \Slowlyo\OwlAdmin\Services\AdminCodeGeneratorService $service */
    class CodeGeneratorController {}

    /** @property \Slowlyo\OwlAdmin\Services\AdminPageService $service */
    class PagesController {}

    /** @property \Slowlyo\OwlAdmin\Services\AdminRelationshipService $service */
    class RelationshipController {}

    /** @property \Slowlyo\OwlAdmin\Services\AdminApiService $service */
    class ApiController {}
}

namespace App\Admin\Controllers {

    /** @property \App\Services\UserService $service */
    class UserController {}
}

namespace Slowlyo\OwlDict\Http\Controllers {

    /** @property \Slowlyo\OwlDict\Services\AdminDictService $service */
    class OwlDictController {}
}

namespace Slowlyo\OwlAdmin\Services {

    /**
     * @method \Slowlyo\OwlAdmin\Models\AdminUser getModel()
     * @method \Slowlyo\OwlAdmin\Models\AdminUser|\Illuminate\Database\Eloquent\Builder query()
     * @mixin AdminUserService_C
     */
    class AdminUserService {}

    /**
     * @method void addRelations(\Slowlyo\OwlAdmin\Models\AdminUser $query, string $scene)
     * @method void sortable(\Slowlyo\OwlAdmin\Models\AdminUser $query)
     * @method void searchable(\Slowlyo\OwlAdmin\Models\AdminUser $query)
     * @method void saved(\Slowlyo\OwlAdmin\Models\AdminUser $query)
     * @method \Slowlyo\OwlAdmin\Models\AdminUser|\Illuminate\Database\Eloquent\Builder listQuery()
     * @method \Slowlyo\OwlAdmin\Models\AdminUser getDetail($id)
     * @method \Slowlyo\OwlAdmin\Models\AdminUser getEditData($id)
     */
    class AdminUserService_C extends AdminUserService {}

    /**
     * @method \Slowlyo\OwlAdmin\Models\AdminMenu getModel()
     * @method \Slowlyo\OwlAdmin\Models\AdminMenu|\Illuminate\Database\Eloquent\Builder query()
     * @mixin AdminMenuService_C
     */
    class AdminMenuService {}

    /**
     * @method void addRelations(\Slowlyo\OwlAdmin\Models\AdminMenu $query, string $scene)
     * @method void sortable(\Slowlyo\OwlAdmin\Models\AdminMenu $query)
     * @method void searchable(\Slowlyo\OwlAdmin\Models\AdminMenu $query)
     * @method void saved(\Slowlyo\OwlAdmin\Models\AdminMenu $query)
     * @method \Slowlyo\OwlAdmin\Models\AdminMenu|\Illuminate\Database\Eloquent\Builder listQuery()
     * @method \Slowlyo\OwlAdmin\Models\AdminMenu getDetail($id)
     * @method \Slowlyo\OwlAdmin\Models\AdminMenu getEditData($id)
     */
    class AdminMenuService_C extends AdminMenuService {}

    /**
     * @method \Slowlyo\OwlAdmin\Models\AdminRole getModel()
     * @method \Slowlyo\OwlAdmin\Models\AdminRole|\Illuminate\Database\Eloquent\Builder query()
     * @mixin AdminRoleService_C
     */
    class AdminRoleService {}

    /**
     * @method void addRelations(\Slowlyo\OwlAdmin\Models\AdminRole $query, string $scene)
     * @method void sortable(\Slowlyo\OwlAdmin\Models\AdminRole $query)
     * @method void searchable(\Slowlyo\OwlAdmin\Models\AdminRole $query)
     * @method void saved(\Slowlyo\OwlAdmin\Models\AdminRole $query)
     * @method \Slowlyo\OwlAdmin\Models\AdminRole|\Illuminate\Database\Eloquent\Builder listQuery()
     * @method \Slowlyo\OwlAdmin\Models\AdminRole getDetail($id)
     * @method \Slowlyo\OwlAdmin\Models\AdminRole getEditData($id)
     */
    class AdminRoleService_C extends AdminRoleService {}

    /**
     * @method \Slowlyo\OwlAdmin\Models\AdminPermission getModel()
     * @method \Slowlyo\OwlAdmin\Models\AdminPermission|\Illuminate\Database\Eloquent\Builder query()
     * @mixin AdminPermissionService_C
     */
    class AdminPermissionService {}

    /**
     * @method void addRelations(\Slowlyo\OwlAdmin\Models\AdminPermission $query, string $scene)
     * @method void sortable(\Slowlyo\OwlAdmin\Models\AdminPermission $query)
     * @method void searchable(\Slowlyo\OwlAdmin\Models\AdminPermission $query)
     * @method void saved(\Slowlyo\OwlAdmin\Models\AdminPermission $query)
     * @method \Slowlyo\OwlAdmin\Models\AdminPermission|\Illuminate\Database\Eloquent\Builder listQuery()
     * @method \Slowlyo\OwlAdmin\Models\AdminPermission getDetail($id)
     * @method \Slowlyo\OwlAdmin\Models\AdminPermission getEditData($id)
     */
    class AdminPermissionService_C extends AdminPermissionService {}

    /**
     * @method \Slowlyo\OwlAdmin\Models\AdminCodeGenerator getModel()
     * @method \Slowlyo\OwlAdmin\Models\AdminCodeGenerator|\Illuminate\Database\Eloquent\Builder query()
     * @mixin AdminCodeGeneratorService_C
     */
    class AdminCodeGeneratorService {}

    /**
     * @method void addRelations(\Slowlyo\OwlAdmin\Models\AdminCodeGenerator $query, string $scene)
     * @method void sortable(\Slowlyo\OwlAdmin\Models\AdminCodeGenerator $query)
     * @method void searchable(\Slowlyo\OwlAdmin\Models\AdminCodeGenerator $query)
     * @method void saved(\Slowlyo\OwlAdmin\Models\AdminCodeGenerator $query)
     * @method \Slowlyo\OwlAdmin\Models\AdminCodeGenerator|\Illuminate\Database\Eloquent\Builder listQuery()
     * @method \Slowlyo\OwlAdmin\Models\AdminCodeGenerator getDetail($id)
     * @method \Slowlyo\OwlAdmin\Models\AdminCodeGenerator getEditData($id)
     */
    class AdminCodeGeneratorService_C extends AdminCodeGeneratorService {}

    /**
     * @method \Slowlyo\OwlAdmin\Models\AdminPage getModel()
     * @method \Slowlyo\OwlAdmin\Models\AdminPage|\Illuminate\Database\Eloquent\Builder query()
     * @mixin AdminPageService_C
     */
    class AdminPageService {}

    /**
     * @method void addRelations(\Slowlyo\OwlAdmin\Models\AdminPage $query, string $scene)
     * @method void sortable(\Slowlyo\OwlAdmin\Models\AdminPage $query)
     * @method void searchable(\Slowlyo\OwlAdmin\Models\AdminPage $query)
     * @method void saved(\Slowlyo\OwlAdmin\Models\AdminPage $query)
     * @method \Slowlyo\OwlAdmin\Models\AdminPage|\Illuminate\Database\Eloquent\Builder listQuery()
     * @method \Slowlyo\OwlAdmin\Models\AdminPage getDetail($id)
     * @method \Slowlyo\OwlAdmin\Models\AdminPage getEditData($id)
     */
    class AdminPageService_C extends AdminPageService {}

    /**
     * @method \Slowlyo\OwlAdmin\Models\AdminRelationship getModel()
     * @method \Slowlyo\OwlAdmin\Models\AdminRelationship|\Illuminate\Database\Eloquent\Builder query()
     * @mixin AdminRelationshipService_C
     */
    class AdminRelationshipService {}

    /**
     * @method void addRelations(\Slowlyo\OwlAdmin\Models\AdminRelationship $query, string $scene)
     * @method void sortable(\Slowlyo\OwlAdmin\Models\AdminRelationship $query)
     * @method void searchable(\Slowlyo\OwlAdmin\Models\AdminRelationship $query)
     * @method void saved(\Slowlyo\OwlAdmin\Models\AdminRelationship $query)
     * @method \Slowlyo\OwlAdmin\Models\AdminRelationship|\Illuminate\Database\Eloquent\Builder listQuery()
     * @method \Slowlyo\OwlAdmin\Models\AdminRelationship getDetail($id)
     * @method \Slowlyo\OwlAdmin\Models\AdminRelationship getEditData($id)
     */
    class AdminRelationshipService_C extends AdminRelationshipService {}

    /**
     * @method \Slowlyo\OwlAdmin\Models\AdminApi getModel()
     * @method \Slowlyo\OwlAdmin\Models\AdminApi|\Illuminate\Database\Eloquent\Builder query()
     * @mixin AdminApiService_C
     */
    class AdminApiService {}

    /**
     * @method void addRelations(\Slowlyo\OwlAdmin\Models\AdminApi $query, string $scene)
     * @method void sortable(\Slowlyo\OwlAdmin\Models\AdminApi $query)
     * @method void searchable(\Slowlyo\OwlAdmin\Models\AdminApi $query)
     * @method void saved(\Slowlyo\OwlAdmin\Models\AdminApi $query)
     * @method \Slowlyo\OwlAdmin\Models\AdminApi|\Illuminate\Database\Eloquent\Builder listQuery()
     * @method \Slowlyo\OwlAdmin\Models\AdminApi getDetail($id)
     * @method \Slowlyo\OwlAdmin\Models\AdminApi getEditData($id)
     */
    class AdminApiService_C extends AdminApiService {}
}

namespace App\Services {

    /**
     * @method \App\Models\User getModel()
     * @method \App\Models\User|\Illuminate\Database\Eloquent\Builder query()
     * @mixin UserService_C
     */
    class UserService {}

    /**
     * @method void addRelations(\App\Models\User $query, string $scene)
     * @method void sortable(\App\Models\User $query)
     * @method void searchable(\App\Models\User $query)
     * @method void saved(\App\Models\User $query)
     * @method \App\Models\User|\Illuminate\Database\Eloquent\Builder listQuery()
     * @method \App\Models\User getDetail($id)
     * @method \App\Models\User getEditData($id)
     */
    class UserService_C extends UserService {}
}

namespace Slowlyo\OwlDict\Services {

    /**
     * @method \Slowlyo\OwlDict\Models\AdminDict getModel()
     * @method \Slowlyo\OwlDict\Models\AdminDict|\Illuminate\Database\Eloquent\Builder query()
     * @mixin AdminDictService_C
     */
    class AdminDictService {}

    /**
     * @method void addRelations(\Slowlyo\OwlDict\Models\AdminDict $query, string $scene)
     * @method void sortable(\Slowlyo\OwlDict\Models\AdminDict $query)
     * @method void searchable(\Slowlyo\OwlDict\Models\AdminDict $query)
     * @method void saved(\Slowlyo\OwlDict\Models\AdminDict $query)
     * @method \Slowlyo\OwlDict\Models\AdminDict|\Illuminate\Database\Eloquent\Builder listQuery()
     * @method \Slowlyo\OwlDict\Models\AdminDict getDetail($id)
     * @method \Slowlyo\OwlDict\Models\AdminDict getEditData($id)
     */
    class AdminDictService_C extends AdminDictService {}
}
