sentence(Structure)--> sentence(Structure, _, _).
sentence(node(sentence, [NG, VG]), Numeric, Party)--> noun_group(NG, Numeric, Party, main), verb_group(VG, Numeric, Party), !.
sentence(node(numeric_error([Numeric1, Party1], [Numeric2, Party2]), [NG, VG]), _, _)--> noun_group(NG, Numeric1, Party1, main), verb_group(VG, Numeric2, Party2), !.
noun_group(node(noun_group, [P]), Numeric, Party, Role)--> pronoun(P, Numeric, Party, Role).
noun_group(node(noun_group, [PR, NUM, ADJ, NOUN]), Numeric, third, Role)--> whose_pref(PR, _), numeral(NUM, Numeric), adjectives(ADJ), noun(NOUN, Numeric, Role), !.
noun_group(node(numeric_error(Numeric1,Numeric2), [PR, NUM, ADJ, NOUN]), Numeric, third, Role)--> whose_pref(PR, _), numeral(NUM, Numeric1), adjectives(ADJ), noun(NOUN, Numeric2, Role), !.
noun_group(node(noun_group, [PN, NUM, ADJ, NOUN]), Numeric, third, Role)--> pronoun(PN, Numeric, _, whose_pref), numeral(NUM, Numeric), adjectives(ADJ), noun(NOUN, Numeric, Role), !.
noun_group(node(numeric_error(Numeric1, Numeric2, Numeric3), [PN, NUM, ADJ, NOUN]), Numeric, third, Role)--> pronoun(PN, Numeric1, _, whose_pref), numeral(NUM, Numeric2), adjectives(ADJ), noun(NOUN, Numeric3, Role), !.
noun_group(node(noun_group, [ART, ADJ, NOUN, POST]), Numeric, third, Role)--> article(ART, indef), adjectives(ADJ), noun(NOUN, Numeric, Role), whose_post(POST).
noun_group(node(noun_group, [ART, ADJ, NOUN, POST]), Numeric, third, Role)--> article(ART, def), adjectives(ADJ), noun(NOUN, Numeric, Role), whose_post(POST).
noun_group(node(noun_group, [NUM, ADJ, NOUN, POST]), plural, third, Role)--> numeral(NUM, plural), adjectives(ADJ), noun(NOUN, plural, Role), whose_post(POST).
whose_pref(node(pref, [PN, NUM, ADJ, NOUN]), Numeric)--> pronoun(PN, Numeric, _, whose_pref), numeral(NUM, countable), adjectives(ADJ), noun(NOUN, Numeric, whose), !.
whose_pref(node(numeric_error(Numeric1,Numeric2), [PN, NUM, ADJ, NOUN]), _)--> pronoun(PN, Numeric1, _, whose_pref), numeral(NUM, countable), adjectives(ADJ), noun(NOUN, Numeric2, whose), !.
adjectives(node(adjectives, [ADJ|T]))--> adjective(ADJ), adjectives(node(adjectives, T)), !.
adjectives(node(adjectives, []))--> [].
whose_post(node(post, [PREP, NG]))--> preposition(PREP), noun_group(NG, _, _, main).

verb_group(node(verb_group, [MV, NG]), Numeric, Party)--> modal_verb(MV, Numeric, Party), noun_group(NG, _, _, secondary).
verb_group(node(verb_group, [MV, ADJ]), Numeric, Party)--> modal_verb(MV, Numeric, Party), adjective(ADJ).
verb_group(node(verb_group, [VERB, NG]), Numeric, Party)--> verb(VERB, Numeric, Party), noun_group(NG, _, _, secondary).
verb_group(node(verb_group, [VERB, AD]), Numeric, Party)--> verb(VERB, Numeric, Party), adverb(AD).

adverb(node(adverb(hard), []))--> [hard].
adverb(node(adverb(early), []))--> [early].
adverb(node(adverb(very_much), []))--> [very, much].
adverb(node(adverb(lazily), []))--> [lazily].
adverb(node(adverb(far_away), []))--> [far, away].

modal_verb(node(modal(am), []), singular, first)--> [am].
modal_verb(node(modal(are), []), singular, second)--> [are].
modal_verb(node(modal(is), []), singular, third)--> [is].
modal_verb(node(modal(are), []), plural, first)--> [are].
modal_verb(node(modal(are), []), plural, second)--> [are].
modal_verb(node(modal(are), []), plural, third)--> [are].

verb(VB, plural, first)--> verb(VB, singular, first).
verb(VB, plural, second)--> verb(VB, singular, first).
verb(VB, plural, third)--> verb(VB, singular, first).
verb(VB, singular, second)--> verb(VB, singular, first).
verb(node(verb(like), []), singular, first)--> [like].
verb(node(verb(likes), []), singular, third)--> [likes].
verb(node(verb(prefer), []), singular, first)--> [prefer].
verb(node(verb(prefers), []), singular, third)--> [prefers].
verb(node(verb(work), []), singular, first)--> [work].
verb(node(verb(works), []), singular, third)--> [works].
verb(node(verb(make), []), singular, first)--> [make].
verb(node(verb(makes), []), singular, third)--> [makes].

preposition(node(prep(of), []))--> [of].
preposition(node(prep(of), []))--> [from].
preposition(node(prep(from), []))--> [on].
preposition(node(prep(under), []))--> [under].
preposition(node(prep(inside), []))--> [inside].
preposition(node(prep(in), []))--> [in].
preposition(node(prep(near), []))--> [near].
preposition(node(prep(before), []))--> [before].

article(node(article(a), []), indef)--> [a].
article(node(article(the), []), def)--> [the].

noun(N, H, secondary)--> noun(N, H, main).
noun(node(noun(book), []), singular, main)--> [book].
noun(node(noun(books), []), plural, main)--> [books].
noun(node(noun(bookcs), []), singular, whose)--> [bookcs].
noun(node(noun(booksc), []), plural, whose)--> [booksc].
noun(node(noun(father), []), singular, main)--> [father].
noun(node(noun(fathers), []), plural, main)--> [fathers].
noun(node(noun(fathercs), []), singular, whose)--> [fathercs].
noun(node(noun(fathersc), []), plural, whose)--> [fathersc].
noun(node(noun(day), []), singular, main)--> [day].
noun(node(noun(days), []), plural, main)--> [days].
noun(node(noun(daycs), []), singular, whose)--> [daycs].
noun(node(noun(daysc), []), plural, whose)--> [daysc].

adjective(node(adj(fast), []))--> [fast].
adjective(node(adj(beautiful), []))--> [beautiful].
adjective(node(adj(lazy), []))--> [lazy].
adjective(node(adj(long), []))--> [long].
adjective(node(adj(tasty), []))--> [tasty].
adjective(node(adj(exciting), []))--> [exciting].
adjective(node(adj(strong), []))--> [strong].
adjective(node(adj(dear), []))--> [dear].
adjective(node(adj(best), []))--> [best].
adjective(node(adj(good), []))--> [good].

numeral(node(num(one), []), singular)--> [one].
numeral(N, plural)--> numeral(N, countable).
numeral(N, singular)--> numeral(N, countable).
numeral(node(num(first), []), countable)--> [first].
numeral(node(num(two), []), plural)--> [two].
numeral(node(num(second), []), countable)--> [second].
numeral(node(num([]), []), singular)--> [].
numeral(node(num([]), []), countable)--> [].
numeral(node(num([]), []), plural)--> [].

pronoun(node(pronoun(my), []), singular, first, whose_pref)--> [my].
pronoun(node(pronoun(my), []), plural, first, whose_pref)--> [my].
pronoun(node(pronoun(your), []), singular, second, whose_pref)--> [your].
pronoun(node(pronoun(your), []), plural, second, whose_pref)--> [your].
pronoun(node(pronoun(this), []), singular, third, whose_pref)--> [this].
pronoun(node(pronoun(that), []), singular, third, whose_pref)--> [that].
pronoun(node(pronoun(these), []), plural, third, whose_pref)--> [these].
pronoun(node(pronoun(i), []), singular, first, main)--> [i].
pronoun(node(pronoun(you), []), _, second, main)--> [you].
pronoun(node(pronoun(he), []), singular, third, main)--> [he].
pronoun(node(pronoun(she), []), singular, third, main)--> [she].
pronoun(node(pronoun(it), []), singular, third, main)--> [it].
pronoun(node(pronoun(we), []), plural, first, main)--> [we].
pronoun(node(pronoun(they), []), plural, third, main)--> [they].
pronoun(node(pronoun(me), []), singular, first, secondary)--> [me].
