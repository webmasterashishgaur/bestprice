package bestprice

@TestFor(PoblacionController)
@Mock(Poblacion)
class PoblacionControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/poblacion/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.poblacionInstanceList.size() == 0
        assert model.poblacionInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.poblacionInstance != null
    }

    void testSave() {
        controller.save()

        assert model.poblacionInstance != null
        assert view == '/poblacion/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/poblacion/show/1'
        assert controller.flash.message != null
        assert Poblacion.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/poblacion/list'


        populateValidParams(params)
        def poblacion = new Poblacion(params)

        assert poblacion.save() != null

        params.id = poblacion.id

        def model = controller.show()

        assert model.poblacionInstance == poblacion
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/poblacion/list'


        populateValidParams(params)
        def poblacion = new Poblacion(params)

        assert poblacion.save() != null

        params.id = poblacion.id

        def model = controller.edit()

        assert model.poblacionInstance == poblacion
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/poblacion/list'

        response.reset()


        populateValidParams(params)
        def poblacion = new Poblacion(params)

        assert poblacion.save() != null

        // test invalid parameters in update
        params.id = poblacion.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/poblacion/edit"
        assert model.poblacionInstance != null

        poblacion.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/poblacion/show/$poblacion.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        poblacion.clearErrors()

        populateValidParams(params)
        params.id = poblacion.id
        params.version = -1
        controller.update()

        assert view == "/poblacion/edit"
        assert model.poblacionInstance != null
        assert model.poblacionInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/poblacion/list'

        response.reset()

        populateValidParams(params)
        def poblacion = new Poblacion(params)

        assert poblacion.save() != null
        assert Poblacion.count() == 1

        params.id = poblacion.id

        controller.delete()

        assert Poblacion.count() == 0
        assert Poblacion.get(poblacion.id) == null
        assert response.redirectedUrl == '/poblacion/list'
    }
}
