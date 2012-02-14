package bestprice



import org.junit.*
import grails.test.mixin.*

@TestFor(EstatusController)
@Mock(Estatus)
class EstatusControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/estatus/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.estatusInstanceList.size() == 0
        assert model.estatusInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.estatusInstance != null
    }

    void testSave() {
        controller.save()

        assert model.estatusInstance != null
        assert view == '/estatus/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/estatus/show/1'
        assert controller.flash.message != null
        assert Estatus.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/estatus/list'


        populateValidParams(params)
        def estatus = new Estatus(params)

        assert estatus.save() != null

        params.id = estatus.id

        def model = controller.show()

        assert model.estatusInstance == estatus
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/estatus/list'


        populateValidParams(params)
        def estatus = new Estatus(params)

        assert estatus.save() != null

        params.id = estatus.id

        def model = controller.edit()

        assert model.estatusInstance == estatus
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/estatus/list'

        response.reset()


        populateValidParams(params)
        def estatus = new Estatus(params)

        assert estatus.save() != null

        // test invalid parameters in update
        params.id = estatus.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/estatus/edit"
        assert model.estatusInstance != null

        estatus.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/estatus/show/$estatus.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        estatus.clearErrors()

        populateValidParams(params)
        params.id = estatus.id
        params.version = -1
        controller.update()

        assert view == "/estatus/edit"
        assert model.estatusInstance != null
        assert model.estatusInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/estatus/list'

        response.reset()

        populateValidParams(params)
        def estatus = new Estatus(params)

        assert estatus.save() != null
        assert Estatus.count() == 1

        params.id = estatus.id

        controller.delete()

        assert Estatus.count() == 0
        assert Estatus.get(estatus.id) == null
        assert response.redirectedUrl == '/estatus/list'
    }
}
