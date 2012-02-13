package bestprice

@TestFor(CompradorController)
@Mock(Comprador)
class CompradorControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/comprador/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.compradorInstanceList.size() == 0
        assert model.compradorInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.compradorInstance != null
    }

    void testSave() {
        controller.save()

        assert model.compradorInstance != null
        assert view == '/comprador/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/comprador/show/1'
        assert controller.flash.message != null
        assert Comprador.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/comprador/list'


        populateValidParams(params)
        def comprador = new Comprador(params)

        assert comprador.save() != null

        params.id = comprador.id

        def model = controller.show()

        assert model.compradorInstance == comprador
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/comprador/list'


        populateValidParams(params)
        def comprador = new Comprador(params)

        assert comprador.save() != null

        params.id = comprador.id

        def model = controller.edit()

        assert model.compradorInstance == comprador
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/comprador/list'

        response.reset()


        populateValidParams(params)
        def comprador = new Comprador(params)

        assert comprador.save() != null

        // test invalid parameters in update
        params.id = comprador.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/comprador/edit"
        assert model.compradorInstance != null

        comprador.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/comprador/show/$comprador.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        comprador.clearErrors()

        populateValidParams(params)
        params.id = comprador.id
        params.version = -1
        controller.update()

        assert view == "/comprador/edit"
        assert model.compradorInstance != null
        assert model.compradorInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/comprador/list'

        response.reset()

        populateValidParams(params)
        def comprador = new Comprador(params)

        assert comprador.save() != null
        assert Comprador.count() == 1

        params.id = comprador.id

        controller.delete()

        assert Comprador.count() == 0
        assert Comprador.get(comprador.id) == null
        assert response.redirectedUrl == '/comprador/list'
    }
}
