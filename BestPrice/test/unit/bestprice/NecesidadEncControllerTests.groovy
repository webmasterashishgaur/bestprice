package bestprice

@TestFor(NecesidadEncController)
@Mock(NecesidadEnc)
class NecesidadEncControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/necesidadEnc/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.necesidadEncInstanceList.size() == 0
        assert model.necesidadEncInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.necesidadEncInstance != null
    }

    void testSave() {
        controller.save()

        assert model.necesidadEncInstance != null
        assert view == '/necesidadEnc/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/necesidadEnc/show/1'
        assert controller.flash.message != null
        assert NecesidadEnc.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/necesidadEnc/list'


        populateValidParams(params)
        def necesidadEnc = new NecesidadEnc(params)

        assert necesidadEnc.save() != null

        params.id = necesidadEnc.id

        def model = controller.show()

        assert model.necesidadEncInstance == necesidadEnc
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/necesidadEnc/list'


        populateValidParams(params)
        def necesidadEnc = new NecesidadEnc(params)

        assert necesidadEnc.save() != null

        params.id = necesidadEnc.id

        def model = controller.edit()

        assert model.necesidadEncInstance == necesidadEnc
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/necesidadEnc/list'

        response.reset()


        populateValidParams(params)
        def necesidadEnc = new NecesidadEnc(params)

        assert necesidadEnc.save() != null

        // test invalid parameters in update
        params.id = necesidadEnc.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/necesidadEnc/edit"
        assert model.necesidadEncInstance != null

        necesidadEnc.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/necesidadEnc/show/$necesidadEnc.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        necesidadEnc.clearErrors()

        populateValidParams(params)
        params.id = necesidadEnc.id
        params.version = -1
        controller.update()

        assert view == "/necesidadEnc/edit"
        assert model.necesidadEncInstance != null
        assert model.necesidadEncInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/necesidadEnc/list'

        response.reset()

        populateValidParams(params)
        def necesidadEnc = new NecesidadEnc(params)

        assert necesidadEnc.save() != null
        assert NecesidadEnc.count() == 1

        params.id = necesidadEnc.id

        controller.delete()

        assert NecesidadEnc.count() == 0
        assert NecesidadEnc.get(necesidadEnc.id) == null
        assert response.redirectedUrl == '/necesidadEnc/list'
    }
}
