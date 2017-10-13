import tensorflow as tf

with tf.Session() as sess:
    with open('module2/stock.pb', 'rb') as f: 
        graph_def = tf.GraphDef()
        graph_def.ParseFromString(f.read()) 
        output = tf.import_graph_def(graph_def, input_map={'input:0':4.}, return_elements=['output:0'], name='a') 
        print(sess.run(output))
