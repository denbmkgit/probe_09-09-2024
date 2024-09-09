class WordsFinder:
    file_names = []


    def __init__(self, *names_files):
        for name_file in names_files:
            self.file_names.append(name_file)

    all_words = {}

    def get_all_words(self,):
        all_words = {}
        for name in self.file_names:

            with open(name, encoding='utf-8') as file:
                list_ = []
                for line in file:
                    print(type(line))


                    list_k = [',', '.', '!', '=', '?', ' - ', ':', ';']
                    # line = line.lower().replace(',', '')
                   # line = line.replace(' ', '')
                   #  line = line.replace('=', '')
                   #  line = line.replace('!', '')
                   #  line = line.replace(';', '')
                   #  line = line.replace(':', '')
                   #  line = line.replace('?', '')
                   #  line = line.replace(',', '')
                   #  line = line.replace('.', '')
                   #  line = line.replace(' - ', '')
                    for i in list_k:
                        if i in line:

                            print((line, i))
                            line = line.replace(i, '')
                            print(line)


                            for word in line:
                                list_.append(word)

                    all_words[name] = list_

        return all_words
        # print(list_)


    def count(self, word):
        for key, value in self.get_all_words().items():
            # print(key)
            # print(value)
            counting_words = {}
            col_need_words = 0
            # print(word, "it's word 1")
            # print(value, "it's value 1")
            for w in value:
                # print(w)
                # print(w ==  word)
                if word.lower() == w.lower():
                    # print(w, "it's W 1")
                    # print(key, "it's key")
                    col_need_words += 1
                    counting_words [key] = col_need_words
            return counting_words

    def find(self, word):
        for key, value in self.get_all_words().items():
            # print(key, "it's key 1")
            number_words = {}
            col_words = 0
            for w in value:
                col_words += 1
                # print(w, " - it's W,   ", word, " - it's word,   ",  w == word, col_words,   " - it's count_words")
                if w.lower() == word.lower():
                    # print(w, " - it's W,   ", word.lower(), " - it's word,   ", w == word.lower(), col_words, " - it's count_words")
                    # print(key, "it's key 2")
                    number_words[key] = col_words
                    break
            return number_words




# wf = WordsFinder('file1.txt', 'file2.txt', 'file3.txt')
# print(wf.file_names)

# for i in wf.file_names:
#     print(i)

# print(wf.get_all_words())
# wf.count("word11")

finder2 = WordsFinder('test_file.txt')
print(finder2.get_all_words()) # Все слова
print(finder2.find('TEXT')) # 3 слово по счёту
print(finder2.count('teXT')) # 4 слова teXT в тексте всего
