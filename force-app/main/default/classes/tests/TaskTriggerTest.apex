
    static void testInsertMultipleTasks() {
        List<Task> tasks = new List<Task>();
        for (Integer i = 0; i < 10; i++) {
            tasks.add(new Task(
                Subject = 'Teste ' + i,
                Status = 'Not Started',
                Priority = 'Normal'
            ));
        }
        insert tasks;
        // Adicione asserts conforme necessário para validar o comportamento do trigger
    }

    testinsertMultipleTasks();